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
                    MoviesPosterCarrousel(title: "Oraingo filmak",
                                          moviesModel: self.viewModel.dataSourceNowPlaying,
                                        isPoster: false)
                }
            }
            
            Group{
                if !self.viewModel.dataSourcePopular.isEmpty{
                    MoviesPosterCarrousel(title: "Popularrak",
                                          moviesModel: self.viewModel.dataSourcePopular,
                                        isPoster: true)
                }
            }

            Group{
                if !self.viewModel.dataSourceTopRate.isEmpty{
                    MoviesPosterCarrousel(title: "Top filmak",
                                          moviesModel: self.viewModel.dataSourceTopRate,
                                        isPoster: false)
                }
            }

            Group{
                if !self.viewModel.dataSourceUpcoming.isEmpty{
                    MoviesPosterCarrousel(title: "Datozen filmak",
                                          moviesModel: self.viewModel.dataSourceUpcoming,
                                        isPoster: true)
                }
            }
//            Group{
//                if !self.viewModel.dataSourceLatest.isEmpty{
//                    MoviesPosterCarrousel(title: "Azken filmak",
//                                          moviesModel: self.viewModel.dataSourceLatest,
//                                        isPoster: true)
//                }
//            }
            


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
