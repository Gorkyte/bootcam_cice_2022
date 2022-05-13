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
    func fecthDataPopularProvider()
    func fecthDataTopRateProvider()
    func fecthDataUpcomingProvider()
//    func fecthDataLatestProvider()
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
    
    func fecthDataPopularProvider() {
        let request = RequestDTO(params: nil,
                                  method: .get,
                                  endpoint: URLEnpoint.endopontMoviesPopular,
                                  urlContext: .webService)
         self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
             .sink { [weak self] completion in
                 guard self != nil else {return}
                 switch completion{
                 case .finished:
                     debugPrint("finished")
                 case let .failure(error):
                     //debugPrint(error)
                     self?.interactor?.setInformationPopular(completion: .failure(error))
                 }
             } receiveValue: { [weak self] resultData in
                 guard self != nil else {return}
                 self?.interactor?.setInformationPopular(completion: .success(resultData.results))
             }
             .store(in: &cancellable)
    }
    
    func fecthDataTopRateProvider() {
        let request = RequestDTO(params: nil,
                                  method: .get,
                                 endpoint: URLEnpoint.endpointMoviesTopRate,
                                  urlContext: .webService)
         self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
             .sink { [weak self] completion in
                 guard self != nil else {return}
                 switch completion{
                 case .finished:
                     debugPrint("finished")
                 case let .failure(error):
                     //debugPrint(error)
                     self?.interactor?.setInformationTopRate(completion: .failure(error))
                 }
             } receiveValue: { [weak self] resultData in
                 guard self != nil else {return}
                 self?.interactor?.setInformationTopRate(completion: .success(resultData.results))
             }
             .store(in: &cancellable)
    }
    
    func fecthDataUpcomingProvider() {
        let request = RequestDTO(params: nil,
                                  method: .get,
                                  endpoint: URLEnpoint.endpointMoviesUpcoming,
                                  urlContext: .webService)
         self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
             .sink { [weak self] completion in
                 guard self != nil else {return}
                 switch completion{
                 case .finished:
                     debugPrint("finished")
                 case let .failure(error):
                     //debugPrint(error)
                     self?.interactor?.setInformationUpcoming(completion: .failure(error))
                 }
             } receiveValue: { [weak self] resultData in
                 guard self != nil else {return}
                 self?.interactor?.setInformationUpcoming(completion: .success(resultData.results))
             }
             .store(in: &cancellable)
    }
    
//    func fecthDataLatestProvider() {
//        let request = RequestDTO(params: nil,
//                                  method: .get,
//                                  endpoint: URLEnpoint.endpointMoviesLatest,
//                                  urlContext: .webService)
//         self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
//             .sink { [weak self] completion in
//                 guard self != nil else {return}
//                 switch completion{
//                 case .finished:
//                     debugPrint("finished")
//                 case let .failure(error):
//                     //debugPrint(error)
//                     self?.interactor?.setInformationLatest(completion: .failure(error))
//                 }
//             } receiveValue: { [weak self] resultData in
//                 guard self != nil else {return}
//                 self?.interactor?.setInformationLatest(completion: .success(resultData.results))
//             }
//             .store(in: &cancellable)
//    }
    

}
