//
//  HomeViewModel.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 10/5/22.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var selectedTabItem: TabItemViewModel.TabItemType = .movies
    
    let tabItemViewModels = [
        TabItemViewModel(imageName: "tv.circle", title: "Filmak", type: .movies),
        TabItemViewModel(imageName: "play.circle", title: "Ikuskizunak", type: .shows),
        TabItemViewModel(imageName: "person.2.circle", title: "Pertsonak", type: .people),
        TabItemViewModel(imageName: "magnifyingglass.circle", title: "Bilatu", type: .search),
        TabItemViewModel(imageName: "person.circle.fill", title: "Profila", type: .profile)
//        TabItemViewModel(imageName: "person.circle.fill", title: "Profila", type: .profile2)
    ]
    
}

struct TabItemViewModel: Hashable {
    let imageName: String
    let title: String
    let type: TabItemType
    
    enum TabItemType {
        case movies
        case shows
        case people
        case search
        case profile
//        case profile2
    }
}
