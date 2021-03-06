/*

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation
import Combine

// Input Protocol
protocol ShowsProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataTVAiringTodayProvider()
    func fetchDataTVOnTheAirProvider()
    func fetchDataTVPopularProvider()
    func fetchDataTVTopRateProvider()
}

final class ShowsProvider: BaseProvider{
    
    // MARK: - DI
    weak var interactor: ShowsProviderOutputProtocol? {
        super.baseInteractor as? ShowsProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

extension ShowsProvider: ShowsProviderInputProtocol{
    
    func fetchDataTVAiringTodayProvider(){
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointTVAiringToday,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request,
                                           entityClass: ShowsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationTVAiringToday(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationTVAiringToday(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    func fetchDataTVOnTheAirProvider(){
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointTVOnTheAir,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request,
                                           entityClass: ShowsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationTVOnTheAir(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationTVOnTheAir(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
        
    }
    func fetchDataTVPopularProvider(){
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointTVPopular,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request,
                                           entityClass: ShowsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationTVPopular(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationTVPopular(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
        
    }
    func fetchDataTVTopRateProvider(){
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointTVTopRate,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request,
                                           entityClass: ShowsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationTVTopRate(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationTVTopRate(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
        
    }
    
    

}

/*
// MARK: - Request de apoyo
struct ShowsRequestDTO {
    
    static func requestData() -> RequestDTO {
        let request = RequestDTO(arrayParams: nil, method: .get, endpoint: URLEndpoint.endpointTVAiringToday, urlContext: .webService)
        return request
        
    }
    
}
*/
