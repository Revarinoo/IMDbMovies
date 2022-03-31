//
//  MovieVideoModel.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 31/03/22.
//

import Foundation

struct MovieVideoResponse: Codable {
    let results: [MovieVideo]
}

struct MovieVideo: Codable {
    let key: String
    let name: String
}
