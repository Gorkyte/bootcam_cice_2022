//
//  MoviesView.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 2/5/22.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesViewModel() // StateObject solo en el padre
    
    var body: some View {
        
        List{
            Group{
                if !self.viewModel.dataSourceNowPlaying.isEmpty{
                    MoviesPosterCarrousel(title: "Azken filmak",
                                          moviesModel: self.viewModel.dataSourceNowPlaying,
                                        isPoster: false)
                }
            }

        }
        
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Filmak"))
        .onAppear{
            self.viewModel.fetchData()
        }

    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(viewModel: MoviesViewModel())
    }
}
