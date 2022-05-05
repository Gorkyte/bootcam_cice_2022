//
//  MoviesViewModel.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 2/5/22.
//

import Foundation

// Output del Interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: MoviesInteractorInputProtocol? {
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    // MARK: - Variables
    @Published var dataSourceNowPlaying: [ResultNowPlaying] = []
    
    
    // MARK: - Metodos publicos para View
    func fetchData() {
        self.interactor?.fecthDataNowPlayingInteractor()
    }
    
}

extension MoviesViewModel: MoviesInteractorOutputProtocol{
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?){
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
        
    }
}
