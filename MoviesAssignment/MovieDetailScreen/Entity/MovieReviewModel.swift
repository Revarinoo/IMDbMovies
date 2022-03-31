//
//  MovieReviewModel.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import Foundation

struct MovieReviewResponse: Codable {
    let results: [MovieReview]
}

struct MovieReview: Codable, Identifiable {
    let id: String
    let authorDetail: Author
    let content: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case authorDetail = "author_details"
        case content
        case updatedAt = "updated_at"
    }
}

struct Author: Codable {
    let username: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case username
        case avatar = "avatar_path"
    }
}
