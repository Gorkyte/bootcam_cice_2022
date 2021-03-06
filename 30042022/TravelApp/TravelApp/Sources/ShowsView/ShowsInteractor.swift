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
    func fetchDataAiringTodayInteractor()
    func fetchDataOnTheAirInteractor()
    func fetchDataPopularInteractor()
    func fetchDataTopRatedInteractor()
}


// Output del provider
protocol ShowsProviderOutputProtocol: BaseProviderOutputProtocol{
    func setInformationAiringToday(completion: Result<[ResultShows]?,NetworkError>)
    func setInformationOnTheAir(completion: Result<[ResultShows]?,NetworkError>)
    func setInformationPopular(completion: Result<[ResultShows]?,NetworkError>)
    func setInformationTopRated(completion: Result<[ResultShows]?,NetworkError>)
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
    
    private func transformDataFromShowsToMovieTVModelView(data: [ResultShows]?) -> [ShowsTVModelView]? {
        var datasourceMoviesTVModelView: [ShowsTVModelView] = []
        if let dataUnw = data {
            for item in 0..<dataUnw.count{
                let objc = ShowsTVModelView(id: dataUnw[item].id,
                                             backdropPath: dataUnw[item].backdropPath,
                                             posterPath: dataUnw[item].posterPath,
                                             name: dataUnw[item].name)
                datasourceMoviesTVModelView.append(objc)
            }
        }
        return datasourceMoviesTVModelView
    }
    
}

// Input del Interactor
extension ShowsInteractor: ShowsInteractorInputProtocol {
    func fetchDataAiringTodayInteractor(){
        self.provider?.fetchDataAiringTodayProvider()
    }
    
    func fetchDataOnTheAirInteractor(){
        self.provider?.fetchDataOnTheAirProvider()
        
    }
    
    func fetchDataPopularInteractor(){
        self.provider?.fetchDataPopularProvider()
    }
    func fetchDataTopRatedInteractor(){
        self.provider?.fetchDataTopRatedProvider()
    }
    
}

// Output del provider
extension ShowsInteractor: ShowsProviderOutputProtocol{
    
    func setInformationAiringToday(completion: Result<[ResultShows]?,NetworkError>){
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoAiringToday(data: self.transformDataFromShowsToMovieTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationOnTheAir(completion: Result<[ResultShows]?,NetworkError>) {
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoOnTheAir(data: self.transformDataFromShowsToMovieTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    
    func setInformationPopular(completion: Result<[ResultShows]?,NetworkError>){
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoPopular(data: self.transformDataFromShowsToMovieTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationTopRated(completion: Result<[ResultShows]?,NetworkError>){
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoTopRated(data: self.transformDataFromShowsToMovieTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
}
