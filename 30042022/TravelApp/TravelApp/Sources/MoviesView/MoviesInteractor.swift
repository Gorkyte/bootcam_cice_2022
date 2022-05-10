//
//  MoviesInteractor.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 3/5/22.
//

import Foundation


// Input Interactor
protocol MoviesInteractorInputProtocol: BaseInteractorInputProtocol{
    func fecthDataNowPlayingInteractor()
    func fecthDataPopularInteractor()
    func fecthDataTopRateInteractor()
    func fecthDataUpcomingInteractor()
    func fecthDataLatestInteractor()
    
}

// Output Provider
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol{
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?,NetworkError>)
    func setInformationPopular(completion: Result<[ResultNowPlaying]?,NetworkError>)
    func setInformationTopRate(completion: Result<[ResultNowPlaying]?,NetworkError>)
    func setInformationUpcoming(completion: Result<[ResultNowPlaying]?,NetworkError>)
    func setInformationLatest(completion: Result<[ResultNowPlaying]?,NetworkError>)
}

final class MoviesInteractor: BaseInteractor {
    
    //MARK: - DI
    weak var viewModel: MoviesInteractorOutputProtocol? {
        super.baseViewModel as? MoviesInteractorOutputProtocol
    }
    
    //MARK: - DI
    var provider: MoviesProviderInputProtocol? {
        super.baseProvider as? MoviesProviderInputProtocol
    }
    
    // Metodos
    func transformDataResultToMoviesTVModelView(data: [ResultNowPlaying]?) -> [MoviesTVModelView]? {
        var datasourceMoviesTV: [MoviesTVModelView] = []
        if let dataUnw = data{
            for index in 0..<dataUnw.count{
                let object = MoviesTVModelView(id: dataUnw[index].id,
                                               backdropPath: dataUnw[index].backdropPath,
                                               posterPath: dataUnw[index].posterPath,
                                               name: dataUnw[index].originalTitle)
                datasourceMoviesTV.append(object)
                
            }
        }
        return datasourceMoviesTV
    }
    
    
}

// Input Interactor
extension MoviesInteractor: MoviesInteractorInputProtocol {
    
    func fecthDataNowPlayingInteractor(){
        self.provider?.fecthDataNowPlayingProvider()
    }

    func fecthDataPopularInteractor() {
        self.provider?.fecthDataPopularProvider()
    }
    
    func fecthDataTopRateInteractor() {
        self.provider?.fecthDataTopRateProvider()
    }
    
    func fecthDataUpcomingInteractor() {
        self.provider?.fecthDataUpcomingProvider()
    }
    
    func fecthDataLatestInteractor() {
        self.provider?.fecthDataLatestProvider()
    }
    

}

// Output Provider
extension MoviesInteractor: MoviesProviderOutputProtocol {
    
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?,NetworkError>){
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoNowPlayingViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    
    func setInformationPopular(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoPopularViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationTopRate(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoTopRateViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationUpcoming(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoUpcomingViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationLatest(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoLatestViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    

}
