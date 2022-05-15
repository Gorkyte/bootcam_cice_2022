//
//  DetailShowModelView.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 15/5/22.
//

import Foundation


struct DetailShowModelView {
     
    
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let name: String?
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var backdropUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(backdropPath ?? "")")!
    }
}
