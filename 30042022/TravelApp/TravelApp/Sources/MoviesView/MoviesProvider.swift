//
//  MoviesProvider.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 3/5/22.
//

import Foundation
import Combine

protocol MoviesProviderInputProtocol: BaseProviderInputProtocol {
    func fecthDataNowPlayingProvider()
}

final class MoviesProvider: BaseProvider {
    
    //MARK: - DI
    weak var interactor: MoviesProviderOutputProtocol? {
        super.baseInteractor as? MoviesProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
}

extension MoviesProvider: MoviesProviderInputProtocol{
    func fecthDataNowPlayingProvider() {
       let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEnpoint.endpointMoviesNowPlaying,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    //debugPrint(error)
                    self?.interactor?.setInformationNowPlaying(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationNowPlaying(completion: .success(resultData.results))
            }
            .store(in: &cancellable)

    }
}
