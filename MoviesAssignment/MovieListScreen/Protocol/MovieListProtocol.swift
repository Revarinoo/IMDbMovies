//
//  MovieListProtocol.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import Foundation

protocol MovieListPresenterProtocol: AnyObject {
    var interactor: MovieListInteractorProtocol { get set }
    var movies: [MoviePrimaryInfo] { get set }
    func getMovieInfo(for categoryId: Int, page: Int)
}

protocol MovieListInteractorProtocol: AnyObject {
    var movies: [MoviePrimaryInfo] { get set }
    var moviesPublished: Published<[MoviePrimaryInfo]> { get }
    var moviesPublisher: Published<[MoviePrimaryInfo]>.Publisher { get }
    func fetchMoviePrimaryInfo(for categoryId: Int, page: Int)
}

protocol MovieListRouterProtocol: AnyObject {
    
}
