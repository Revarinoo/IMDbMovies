//
//  HomeViewProtocol.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import Foundation
import SwiftUI

protocol HomePresenterProtocol: AnyObject {
    var interactor: HomeInteractorProtocol { get set }
    func getGenres()
    associatedtype newView: View
    func navigate(for category: String) -> newView
}

protocol HomeInteractorProtocol: AnyObject {
    var genres: [GenresModel] { get set}
    var genresPublished: Published<[GenresModel]> { get }
    var genresPublisher: Published<[GenresModel]>.Publisher { get }
    func fetchGenresFromServer()
}

protocol HomeRouterProtocol: AnyObject {
    associatedtype newView: View
    func goToMovieList(for category: String) -> newView
    
}
