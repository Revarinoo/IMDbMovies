//
//  MoviesModel.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import Foundation

struct MoviesListResponse: Codable {
    let results: [MoviePrimaryInfo]
}

struct MoviePrimaryInfo: Codable, Identifiable, Equatable {
    let id: Int
    let originalTitle: String
    let overview: String
    let imagePath: String
    let releaseDate: String
    let voteAvg: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case imagePath = "poster_path"
        case releaseDate = "release_date"
        case voteAvg = "vote_average"
    }
}
