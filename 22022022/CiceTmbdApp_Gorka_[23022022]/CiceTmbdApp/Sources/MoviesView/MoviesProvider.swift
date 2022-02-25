//
//  MoviesProvider.swift
//  CiceTmbdApp
//
//  Created by Gorka Ormazabal on 24/2/22.
//

import Foundation
import Combine

protocol MoviesProviderInputProtocol: BaseProviderInputProtocol{
    func fetchDataNowPlayingProvider()
}
    
   
final class MoviesProvider: BaseProvider{
    
    // MARK: - DI
    weak var interactor: MoviesProviderOutputProtocol? {
        super.baseInteractor as? MoviesProviderOutputProtocol
    }
        
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

extension MoviesProvider: MoviesProviderInputProtocol {
    func fetchDataNowPlayingProvider(){
        let request = RequestDTO(arrayParams: nil,
                                 method: .get,
                                 endpoint: URLEnpoint.endpointMoviesNowPlaying,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")                    
                case let .failure(error):
                    //debugPrint(error)
                    self?.interactor?.setInformationNowPlaying(completion: .failure(error))
                    
                }
            } receiveValue: { [weak self] resultData in
                //debugPrint(resultData)
                guard self != nil else { return }
                self?.interactor?.setInformationNowPlaying(completion: .success(resultData.results))
                //setInformationNowPlaying(completion: .success(resultData.results))
                debugPrint(resultData)
            }
            .store(in: &cancellable)    // hace el mismo trabajo que ".eraseToAnyPublihser"
                                        // Liberar la memoria, de lo que tenemos arriba

        
    }
}

