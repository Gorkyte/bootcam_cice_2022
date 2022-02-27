//
//  HomeViewModel.swift
//  CiceTmdbApp
//
//  Created by Gorka Ormazabal on 26/2/22.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var selectedTabItem: TabItemViewModel.TabItemType = .movies
    
    let tabItemViewModel = [
        TabItemViewModel(imageName: "tv", tittle: "Movies", type: .movies),
        TabItemViewModel(imageName: "play.tv.fill", tittle: "Shows", type: .shows),
        TabItemViewModel(imageName: "person.2.circle", tittle: "People", type: .people),
        TabItemViewModel(imageName: "magnifyingglass", tittle: "Search", type: .search),
        TabItemViewModel(imageName: "person.fill", tittle: "Profile", type: .profile)
    ]
       
}

struct TabItemViewModel: Hashable {
    let imageName: String
    let tittle: String
    let type: TabItemType
    
    enum TabItemType{
        case movies
        case shows
        case people
        case search
        case profile
        
    }
    
}
