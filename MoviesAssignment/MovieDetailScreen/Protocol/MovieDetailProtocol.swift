//
//  MovieDetailProtocol.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 31/03/22.
//

import Foundation

protocol MovieDetailPresenterProtocol: AnyObject {
    var interactor: MovieDetailInteractorProtocol { get set }
    func getReviews(for id: Int, page: Int)
    func getVideo(for id: Int)
}

protocol MovieDetailInteractorProtocol: AnyObject {
    var reviews: [MovieReview] { get set }
    var reviewPublished: Published<[MovieReview]> { get }
    var reviewPublisher: Published<[MovieReview]>.Publisher { get }
    var videos: [MovieVideo] { get set }
    var videoPublished: Published<[MovieVideo]> { get }
    var videoPublisher: Published<[MovieVideo]>.Publisher { get }
    func fetchReviews(for id: Int, page: Int)
    func fetchVideo(for id: Int)
}

protocol MovieDetailRouterProtocol: AnyObject {
    
}
