//
//  MoviesCoordinator.swift
//  CiceTmbdApp
//
//  Created by Gorka Ormazabal on 24/2/22.
//

import Foundation
import SwiftUI

final class MoviesCoordinator: BaseCoordinator{
    
    //typealias: un nombre pisa a otro
    typealias ContentView = MoviesView
    typealias ViewModel = MoviesViewModel
    typealias Interactor = MoviesInteractor
    typealias Provider = MoviesProvider
    
    static func navigation() -> NavigationView<ContentView>{
        NavigationView{
            self.view()  //=================Desde el Coordinator se le inyecta la Vista,de abajo
        
        }
        
    }
    
    //=================Desde el Coordinator se le inyecta la Vista, desde el ContentView
    
    static func view() -> ContentView{
        
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
    
}

