//
//  MovieDetailInteractor.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 31/03/22.
//

import Foundation

class MovieDetailInteractor: MovieDetailInteractorProtocol {
    @Published var reviews: [MovieReview] = []
    @Published var videos: [MovieVideo] = []
    
    var reviewPublished: Published<[MovieReview]> { _reviews }
    var reviewPublisher: Published<[MovieReview]>.Publisher { $reviews }
    var videoPublished: Published<[MovieVideo]> { _videos }
    var videoPublisher: Published<[MovieVideo]>.Publisher { $videos }
    
    required init(reviews: [MovieReview], videos: [MovieVideo]) {
        self.reviews = reviews
        self.videos = videos
    }
    
    func fetchReviews(for id: Int, page: Int) {
        guard let url = URL(string: AppConstants.baseURL + "movie/\(id)/reviews" + AppConstants.apiKey + "&page=\(page)") else {
            return
        }
        let urlRequest = URLRequest(url: url)
        ApiManager.shared.request(urlRequest, resultType: MovieReviewResponse.self) { result in
            guard let result = result else {
                return
            }
            DispatchQueue.main.async {
                for data in result.results {
                    self.reviews.append(data)
                }
            }
        }
    }
    
    func fetchVideo(for id: Int) {
        guard let url = URL(string: AppConstants.baseURL + "movie/\(id)/videos" + AppConstants.apiKey) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        ApiManager.shared.request(urlRequest, resultType: MovieVideoResponse.self) { result in
            guard let result = result else {
                return
            }
            DispatchQueue.main.async {
                self.videos = result.results.filter { $0.name.contains("Trailer") }
            }
        }
    }
    
    
}
