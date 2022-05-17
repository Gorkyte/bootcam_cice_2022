//
//  ShowsTVModelView.swift
//  TravelApp
//
//  Created by Gorka Ormazabal on 11/5/22.
//

import Foundation

struct ShowsTVModelView: Identifiable {
    
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
