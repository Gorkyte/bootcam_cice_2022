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

// Input del Interactor
protocol ShowsInteractorInputProtocol: BaseInteractorInputProtocol{
    func fetchDataTVAiringTodayInteractor()
    func fetchDataTVOnTheAirInteractor()
    func fetchDataTVPopularInteractor()
    func fetchDataTVTopRateInteractor()
}


// Output del Provider
protocol ShowsProviderOutputProtocol: BaseProviderOutputProtocol{
    func setInformationTVAiringToday(completion: Result<[ResultShows]?, NetworkError>)
    func setInformationTVOnTheAir(completion: Result<[ResultShows]?, NetworkError>)
    func setInformationTVPopular(completion: Result<[ResultShows]?, NetworkError>)
    func setInformationTVTopRate(completion: Result<[ResultShows]?, NetworkError>)
}

final class ShowsInteractor: BaseInteractor {
    
    // MARK: - DI
    weak var viewModel: ShowsInteractorOutputProtocol? {
        super.baseViewModel as? ShowsInteractorOutputProtocol
    }
    
    // MARK: - DI
    var provider: ShowsProviderInputProtocol? {
        super.baseProvider as? ShowsProviderInputProtocol
    }
    
    
    // Metodos
    func transformDataFromShowsToMoviesTVModelView(data: [ResultShows]?) -> [ShowsTVModelView]? {
        var datasourceMoviesTVModelView: [ShowsTVModelView] = []
        if let dataUnw = data {
            for index in 0..<dataUnw.count{
                let object = ShowsTVModelView(id: dataUnw[index].id,
                                               backdropPath: dataUnw[index].backdropPath,
                                               posterPath: dataUnw[index].posterPath,
                                               name: dataUnw[index].name)
                datasourceMoviesTVModelView.append(object)
            }
        }
        return datasourceMoviesTVModelView
    }
    
    
}

// Input del Interactor
extension ShowsInteractor: ShowsInteractorInputProtocol {
    
    func fetchDataTVAiringTodayInteractor() {
        self.provider?.fetchDataTVAiringTodayProvider()
    }
    func fetchDataTVOnTheAirInteractor(){
        self.provider?.fetchDataTVOnTheAirProvider()
    }
    func fetchDataTVPopularInteractor(){
        self.provider?.fetchDataTVPopularProvider()
    }
    func fetchDataTVTopRateInteractor(){
        self.provider?.fetchDataTVTopRateProvider()
    }
    
    
    
}

// Output del Provider
extension ShowsInteractor: ShowsProviderOutputProtocol{
    func setInformationTVAiringToday(completion: Result<[ResultShows]?, NetworkError>){
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoTVAiringTodayViewModel(data: self.transformDataFromShowsToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    func setInformationTVOnTheAir(completion: Result<[ResultShows]?, NetworkError>){
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoTVOnTheAirViewModel(data: self.transformDataFromShowsToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    func setInformationTVPopular(completion: Result<[ResultShows]?, NetworkError>){
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoTVPopularViewModel(data: self.transformDataFromShowsToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    func setInformationTVTopRate(completion: Result<[ResultShows]?, NetworkError>){
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoTVTopRateViewModel(data: self.transformDataFromShowsToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }

}
