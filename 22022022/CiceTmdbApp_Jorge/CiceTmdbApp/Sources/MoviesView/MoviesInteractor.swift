//
//  MoviesInteractor.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 23/2/22.
//

import Foundation

// Input del interactor
protocol MoviesInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataNowPlayingInteractor()
    func fetchDataPopularInteractor()
    func fetchDataTopRateingInteractor()
    func fetchDataUpcomingInteractor()
}

// Output del provider
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol{
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>)
    func setInformationPopular(completion: Result<[ResultNowPlaying]?, NetworkError>)
    func setInformationTopRate(completion: Result<[ResultNowPlaying]?, NetworkError>)
    func setInformationUpcoming(completion: Result<[ResultNowPlaying]?, NetworkError>)
}

final class MoviesInteractor: BaseInteractor {
    
    // MARK: - DI
    weak var viewModel: MoviesInteractorOutputProtocol? {
        super.baseViewModel as? MoviesInteractorOutputProtocol
    }
    
    // MARK: - DI
    var provider: MoviesProviderInputProtocol? {
        super.baseProvider as? MoviesProviderInputProtocol
    }
    
    // Metodos
    func transformDataResultToMoviesTVModelView(data: [ResultNowPlaying]?) -> [MoviesTVModelView]? {
        var datasourceMoviesTV: [MoviesTVModelView] = []
        if let dataUnw = data {
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

// Input del interactor
extension MoviesInteractor: MoviesInteractorInputProtocol{

    
    
    func fetchDataNowPlayingInteractor(){
        self.provider?.fetchDataNowPlayingProvider()
    }
    
    func fetchDataPopularInteractor() {
        self.provider?.fetchDataPopularProvider()
    }
    
    func fetchDataTopRateingInteractor() {
        self.provider?.fetchDataTopRateProvider()
    }
    
    func fetchDataUpcomingInteractor() {
        self.provider?.fetchDataUpcomingProvider()
    }
    

}

// Output del provider
extension MoviesInteractor: MoviesProviderOutputProtocol{
    
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>){
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
    

}
