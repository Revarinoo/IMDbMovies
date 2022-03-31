//
//  HomeViewRouter.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import SwiftUI

class HomeViewRouter: HomeRouterProtocol {
    
    func goToMovieList(for category: String, id: Int) -> some View {
        let presenter = MovieListPresenter(interactor: MovieListInteractor(movies: []), movies: [])
        return MovieListView(presenter: presenter, category: category, genreId: id)
    }
}
