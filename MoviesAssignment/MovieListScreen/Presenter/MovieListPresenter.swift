//
//  MovieListPresenter.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import Combine

class MovieListPresenter: MovieListPresenterProtocol, ObservableObject {
    var interactor: MovieListInteractorProtocol
    @Published var movies: [MoviePrimaryInfo] = []
    private var cancellables = Set<AnyCancellable>()
    
    required init(interactor: MovieListInteractorProtocol, movies: [MoviePrimaryInfo]) {
        self.interactor = interactor
        self.movies = movies
        
        interactor.moviesPublisher
            .assign(to: \.movies, on: self)
            .store(in: &cancellables)
    }
    
    func getMovieInfo(for categoryId: Int, page: Int) {
        interactor.fetchMoviePrimaryInfo(for: categoryId, page: page)
    }
    
}
