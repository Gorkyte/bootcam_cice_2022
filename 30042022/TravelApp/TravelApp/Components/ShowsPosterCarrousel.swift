//
//  ShowsPosterCarrousel.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 11/5/22.
//

import SwiftUI

struct ShowsPosterCarrousel: View {
    
    var title: String
    var moviesModel: [ShowsTVModelView]
    var isPoster: Bool
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack{
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Rectangle()
                    .fill(Color.blue.opacity(0.8))
                    .frame(width: 50, height: 10)
                
            }
            .padding(.bottom, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 20) {
                    ForEach(self.moviesModel){ movie in
                        //ShowPosterCell(model: movie, isPoster: self.isPoster)
                        
                        NavigationLink {
                            //DetailMovieCoordinator.view(dto: DetailMovieCoordinatorDTO(dataId: movie.id ?? 0))
                            DetailShowCoordinator.view()
                            
                        } label: {
                            //MoviePosterCell(model: movie, isPoster: self.isPoster)
                            ShowPosterCell(model: movie, isPoster: self.isPoster)
                        }
                        .buttonStyle(PlainButtonStyle()) // para quitar esa sensacion de boton

                        
                        
                    }
                    
                }
            }
        }
    }
}

struct ShowPosterCell: View {
    
    @ObservedObject var imageLoaderVM = ImageLoader() //
    // StateObject solo en el padre, después, poner ObservedObject
    private var modelData: ShowsTVModelView
    var isPoster: Bool
    
    init(model: ShowsTVModelView, isPoster: Bool? = true){
        self.modelData = model
        self.isPoster = isPoster ?? false
        if isPoster ?? false {
            self.imageLoaderVM.loadImage(whit: modelData.posterUrl)
        } else {
            self.imageLoaderVM.loadImage(whit: modelData.backdropUrl)
        }
    }
    
    var body: some View {
        VStack{
            ZStack{
                if self.imageLoaderVM.image != nil{
                    Image(uiImage: self.imageLoaderVM.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(50)
                        .shadow(radius:10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.green,lineWidth: 5)
                        )
                }else {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.clear]),
                                             startPoint: .bottom,
                                             endPoint: .top))
                }
            }
            .frame(width: self.isPoster ? 240 : 270, height: self.isPoster ? 306 : 150)
            
            if !self.isPoster{
                Text(self.modelData.name ?? "")
                    .fontWeight(.semibold)
                    .padding(.top, 15)
                    .lineLimit(10)

            }
            
        }
    }
}

//struct MoviesPosterCarrousel_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesPosterCarrousel(title: "Azken Filmak",
//                              moviesModel: MoviesServerModel.stubbedMoviesNowPlaying, isPoster: false)
//    }
//}

