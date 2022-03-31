//
//  MovieListRouter.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import SwiftUI

class MovieListRouter: MovieListRouterProtocol {
    
    func goToMovieDetail(info movieInfo: MoviePrimaryInfo) -> some View {
        return MovieDetailView(movieInfo: movieInfo, presenter: MovieDetailPresenter(interactor: MovieDetailInteractor(reviews: [], videos: [])))
    }
}
