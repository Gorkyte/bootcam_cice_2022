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
}

// Output Provider
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol{
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?,NetworkError>)
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
    
    
}

// Input Interactor
extension MoviesInteractor: MoviesInteractorInputProtocol {
    func fecthDataNowPlayingInteractor(){
        self.provider?.fecthDataNowPlayingProvider()
    }

}

// Output Provider
extension MoviesInteractor: MoviesProviderOutputProtocol {
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?,NetworkError>){
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoNowPlayingViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
}
