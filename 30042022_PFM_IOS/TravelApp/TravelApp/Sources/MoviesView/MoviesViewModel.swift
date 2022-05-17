//
//  MoviesViewModel.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 2/5/22.
//

import Foundation

// Output del Interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [MoviesTVModelView]?)
    func setInfoPopularViewModel(data: [MoviesTVModelView]?)
    func setInfoTopRateViewModel(data: [MoviesTVModelView]?)
    func setInfoUpcomingViewModel(data: [MoviesTVModelView]?)
//    func setInfoLatestViewModel(data: [MoviesTVModelView]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: MoviesInteractorInputProtocol? {
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    // MARK: - Variables
    @Published var dataSourceNowPlaying: [MoviesTVModelView] = []
    @Published var dataSourcePopular: [MoviesTVModelView] = []
    @Published var dataSourceTopRate: [MoviesTVModelView] = []
    @Published var dataSourceUpcoming: [MoviesTVModelView] = []
//    @Published var dataSourceLatest: [MoviesTVModelView] = []
    
    
    // MARK: - Metodos publicos para View
    func fetchData() {
        self.interactor?.fecthDataNowPlayingInteractor()
        self.interactor?.fecthDataPopularInteractor()
        self.interactor?.fecthDataTopRateInteractor()
        self.interactor?.fecthDataUpcomingInteractor()
//        self.interactor?.fecthDataLatestInteractor()
        
    }
    
}

//Output del Interactor

extension MoviesViewModel: MoviesInteractorOutputProtocol{
    
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
        self.dataSourceUpcoming.removeAll()
        self.dataSourceUpcoming = data ?? []
    }
    
//    func setInfoLatestViewModel(data: [MoviesTVModelView]?) {
//        self.dataSourceLatest.removeAll()
//        self.dataSourceLatest = data ?? []
//    }
    

}
