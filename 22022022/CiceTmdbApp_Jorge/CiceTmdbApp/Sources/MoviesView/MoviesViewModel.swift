//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 23/2/22.
//

import Foundation

//Output del interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol{
    func setInfoNowPlayingViewModel(data: [MoviesTVModelView]?)
    func setInfoPopularViewModel(data: [MoviesTVModelView]?)
    func setInfoTopRateViewModel(data: [MoviesTVModelView]?)
    func setInfoUpcomingViewModel(data: [MoviesTVModelView]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - Dependences Inyection (DI)
    var interactor: MoviesInteractorInputProtocol?{
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    //MARK: - Variables
    @Published var dataSourceNowPlaying: [MoviesTVModelView] = []
    @Published var dataSourcePopular: [MoviesTVModelView] = []
    @Published var dataSourceTopRate: [MoviesTVModelView] = []
    @Published var dataSourceNowUpcoming: [MoviesTVModelView] = []
    
    //MARK: - Metodos publicos para la View
    func fetchData(){
        self.interactor?.fetchDataNowPlayingInteractor()
        self.interactor?.fetchDataPopularInteractor()
        self.interactor?.fetchDataTopRateingInteractor()
        self.interactor?.fetchDataUpcomingInteractor()
    }
    
}

//Output del interactor
extension MoviesViewModel: MoviesInteractorOutputProtocol {
    
    func setInfoNowPlayingViewModel(data: [MoviesTVModelView]?){
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
    }
    
    func setInfoPopularViewModel(data: [MoviesTVModelView]?) {
        self.dataSourcePopular.removeAll()
        self.dataSourcePopular = data ?? []
    }
    
    func setInfoTopRateViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceTopRate.removeAll()
        self.dataSourceTopRate = data ?? []
    }
    
    func setInfoUpcomingViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceNowUpcoming.removeAll()
        self.dataSourceNowUpcoming = data ?? []
    }
    

}
