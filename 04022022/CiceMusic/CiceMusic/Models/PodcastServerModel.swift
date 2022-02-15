//
//  PodcastServerModel.swift
//  CiceMusic
//
//  Created by CICE on 10/02/2022.
//

import Foundation


// MARK: - PodcastsServerModel
struct PodcastsServerModel: Codable {
    let feed: FeedPodcasts?

    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

// MARK: - Feed
struct FeedPodcasts: Codable {
    let title: String?
    let id: String?
    let author: Author?
    let links: [Link]?
    let copyright: String?
    let country: String?
    let icon: String?
    let updated: String?
    let results: [ResultPodcasts]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case id = "id"
        case author = "author"
        case links = "links"
        case copyright = "copyright"
        case country = "country"
        case icon = "icon"
        case updated = "updated"
        case results = "results"
    }
}



// MARK: - Result
struct ResultPodcasts: Codable {
    let artistName: String?
    let id: String?
    let name: String?
    let kind: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case name = "name"
        case kind = "kind"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case url = "url"
    }
}



