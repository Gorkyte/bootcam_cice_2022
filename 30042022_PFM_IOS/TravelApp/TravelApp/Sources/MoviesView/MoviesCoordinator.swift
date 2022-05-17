//
//  MoviesCoordinator.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 4/5/22.
//

import Foundation
import SwiftUI

final class MoviesCoordinator: BaseCoordinator {
    
    typealias ContentView = MoviesView
    typealias ViewModel = MoviesViewModel
    typealias Interactor = MoviesInteractor
    typealias Provider = MoviesProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView{
            self.view()
        }
    }
    
    static func view() -> ContentView{
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
    
}
