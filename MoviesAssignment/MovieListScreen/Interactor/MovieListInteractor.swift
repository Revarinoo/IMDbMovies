//
//  MovieListInteractor.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import Foundation

class MovieListInteractor: MovieListInteractorProtocol {
    @Published var movies: [MoviePrimaryInfo] = []
    var moviesPublished: Published<[MoviePrimaryInfo]> { _movies }
    var moviesPublisher: Published<[MoviePrimaryInfo]>.Publisher { $movies }
    
    required init(movies: [MoviePrimaryInfo]) {
        self.movies = movies
    }
    
    func fetchMoviePrimaryInfo(for categoryId: Int, page: Int) {
        guard let url = URL(string: AppConstants.baseURL + "discover/movie" + AppConstants.apiKey + "&with_genres=\(categoryId)&page=\(page)") else {
            return
        }
        let urlRequest = URLRequest(url: url)
        ApiManager.shared.request(urlRequest, resultType: MoviesListResponse.self) { result in
            guard let result = result else {
                return
            }
            DispatchQueue.main.async {
                for data in result.results {
                    self.movies.append(data)
                }
            }
        }
    }
}
