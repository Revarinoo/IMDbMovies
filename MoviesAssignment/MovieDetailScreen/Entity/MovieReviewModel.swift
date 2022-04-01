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

struct MovieReview: Codable, Identifiable, Equatable {
    static func == (lhs: MovieReview, rhs: MovieReview) -> Bool {
        return lhs.id == rhs.id
    }
    
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
    let avatar: String?
    
    var avatarURL: URL? {
        guard let avatar = avatar else {
            return nil
        }
        if avatar.contains("https") {
            return URL(string: String(avatar.suffix(avatar.count - 1)))
        }
        else if avatar != "" {
            return URL(string: AppConstants.baseAvatarURL + avatar)
        }
        return nil
    }
    
    enum CodingKeys: String, CodingKey {
        case username
        case avatar = "avatar_path"
    }
}
