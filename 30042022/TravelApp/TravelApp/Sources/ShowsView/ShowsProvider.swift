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
    func fetchDataAiringTodayProvider()
    func fetchDataOnTheAirProvider()
    func fetchDataPopularProvider()
    func fetchDataTopRatedProvider()
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
    
    func fetchDataAiringTodayProvider(){
        self.networkService.requestGeneric(payloadRequest: ShowsRequestDTO.requestData(),
                                           entityClass: ShowsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationAiringToday(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationAiringToday(completion: .success(resultData.results))
            }
            .store(in: &cancellable)

    }
    
    func fetchDataOnTheAirProvider(){
        self.networkService.requestGeneric(payloadRequest: ShowsRequestDTO.requestDataOnTheAir(),
                                           entityClass: ShowsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationOnTheAir(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationOnTheAir(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataPopularProvider(){
        self.networkService.requestGeneric(payloadRequest: ShowsRequestDTO.requestDataPopular(),
                                           entityClass: ShowsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationPopular(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationPopular(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataTopRatedProvider(){
        self.networkService.requestGeneric(payloadRequest: ShowsRequestDTO.requestDataTopRated(),
                                           entityClass: ShowsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationTopRated(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationTopRated(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    

}


// MARK: - Request de apoyo
struct ShowsRequestDTO {
    
    static func requestData() -> RequestDTO {
        let request = RequestDTO(arrayParams: nil, method: .get, endpoint: URLEnpoint.endpointTVAiringToday, urlContext: .webService)
        return request
        
    }
    
    static func requestDataOnTheAir() -> RequestDTO {
        let request = RequestDTO(arrayParams: nil, method: .get, endpoint: URLEnpoint.endpointTVOnTheAir, urlContext: .webService)
        return request
        
    }
    
    static func requestDataPopular() -> RequestDTO {
        let request = RequestDTO(arrayParams: nil, method: .get, endpoint: URLEnpoint.endpointTVPopular, urlContext: .webService)
        return request
        
    }
    
    static func requestDataTopRated() -> RequestDTO {
        let request = RequestDTO(arrayParams: nil, method: .get, endpoint: URLEnpoint.endpointTVTopRated, urlContext: .webService)
        return request
        
    }
    
}
