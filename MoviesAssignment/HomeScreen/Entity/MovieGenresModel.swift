//
//  MovieGenresModel.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import Foundation

struct GenresResponse: Codable {
    let genres: [GenresModel]
}

struct GenresModel: Codable, Identifiable {
    let id: Int
    let name: String
}
