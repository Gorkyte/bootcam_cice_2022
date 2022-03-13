//
//  NetworkService.swift
//  CiceTmbdApp
//
//  Created by Gorka Ormazabal on 24/2/22.
//

import Foundation

import Combine  // Es un nuevo objeto, algo nuevo de Apple, son algo asi como publicadores.
                //Haces la petición, lo transformas y la retornas

protocol NetworkServiceInputProtocol{
    func requestGeneric<M: Decodable>(payloadRequest: RequestDTO, entityClass: M.Type) -> AnyPublisher<M, NetworkError>
}

//==============================================================================================================
//              Todo esto de Combine,  el codigo de abajo explica mejor el profe en su Web ICOLOGIC
//==============================================================================================================


final class NetworkService: NetworkServiceInputProtocol {
    
    func requestGeneric<M>(payloadRequest: RequestDTO, entityClass: M.Type) -> AnyPublisher<M, NetworkError> where M : Decodable {
        let baseUrl = URLEnpoint.getUrlBase(urlContext: payloadRequest.urlContext)
        let endpoint = "\(baseUrl)\(payloadRequest.endpoint)"
        guard let urlUnw = URL(string: endpoint) else {
            return Fail(error: NetworkError(status: .badURL))
                .eraseToAnyPublisher()  // Después de enviar el Error, siempre hay que liberar (esto con AnyPublisher)
        }
        let urlRequest = URLRequest(url: urlUnw)
        return URLSession
            .shared
            .dataTaskPublisher(for: urlRequest)
            .mapError { error -> NetworkError in
                NetworkError(error: error)
            }
            .flatMap{ (data, response) -> AnyPublisher<M, NetworkError> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail (error: NetworkError(status: .badRequest)).eraseToAnyPublisher()
                }
                if(200...299).contains(httpResponse.statusCode){
                    return Just(data)
                        .decode(type: M.self, decoder: JSONDecoder())
                        .mapError{error in
                            NetworkError(status: .accepted)
                        }
                        .eraseToAnyPublisher()
                } else {
                    let error = NetworkError(errorCode: httpResponse.statusCode)
                    return Fail(error: NetworkError(error: error)).eraseToAnyPublisher()
                }
                
            }
            // ======= Una vez que se haga todo lo de arriba, todo ese proceso, se tiene que hacer en el hilo princial
            .receive(on: DispatchQueue.main)  // lo que haciamos con ..async, en Combine se hace asi
            .eraseToAnyPublisher()
            
    }
    
    
}
