//
//  MovieListPresenter.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import Combine
import SwiftUI

class MovieListPresenter: MovieListPresenterProtocol, ObservableObject {
    var interactor: MovieListInteractorProtocol
    @Published var movies: [MoviePrimaryInfo] = []
    private var cancellables = Set<AnyCancellable>()
    var router: MovieListRouter
    
    required init(interactor: MovieListInteractorProtocol, movies: [MoviePrimaryInfo]) {
        self.interactor = interactor
        self.movies = movies
        self.router = MovieListRouter()
        
        interactor.moviesPublisher
            .assign(to: \.movies, on: self)
            .store(in: &cancellables)
    }
    
    func getMovieInfo(for categoryId: Int, page: Int) {
        interactor.fetchMoviePrimaryInfo(for: categoryId, page: page)
    }
    
    func navigate(info movieInfo: MoviePrimaryInfo) -> some View {
        return router.goToMovieDetail(info: movieInfo)
    }
    
}
