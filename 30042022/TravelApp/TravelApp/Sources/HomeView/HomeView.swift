//
//  HomeView.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 10/5/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    
    var body: some View {
        TabView(selection: self.$viewModel.selectedTabItem) {
            ForEach(self.viewModel.tabItemViewModels, id: \.self) { item in
                tabView(tabItemType: item.type)
                    .tabItem {
                        Image(systemName: item.imageName)
                        Text(item.title)
                    }.tag(item.type)
                
            }
        }
        .accentColor(.green)
        .environment(\.colorScheme, .dark)
    }
    
    @ViewBuilder
    func tabView(tabItemType: TabItemViewModel.TabItemType) -> some View {
        switch tabItemType {
        case .movies:
            MoviesCoordinator.navigation()
        case .shows:
            ShowsCoordinator.navigation()
        case .people:
            PeoplePopularCoordinator.navigation()
        case .search:
            SearchCoordinator.navigation()
        case .profile:
            ProfileView()
//        case .profile2:
//            MoviesCoordinator.navigation()
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
