//
//  MovieListProtocol.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import SwiftUI

protocol MovieListPresenterProtocol: AnyObject {
    var interactor: MovieListInteractorProtocol { get set }
    var movies: [MoviePrimaryInfo] { get set }
    func getMovieInfo(for categoryId: Int, page: Int)
    associatedtype newView: View
    func navigate(info movieInfo: MoviePrimaryInfo) -> newView
}

protocol MovieListInteractorProtocol: AnyObject {
    var movies: [MoviePrimaryInfo] { get set }
    var moviesPublished: Published<[MoviePrimaryInfo]> { get }
    var moviesPublisher: Published<[MoviePrimaryInfo]>.Publisher { get }
    func fetchMoviePrimaryInfo(for categoryId: Int, page: Int)
}

protocol MovieListRouterProtocol: AnyObject {
    associatedtype newView: View
    func goToMovieDetail(info movieInfo: MoviePrimaryInfo) -> newView
}
