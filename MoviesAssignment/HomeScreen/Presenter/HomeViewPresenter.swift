//
//  HomeViewPresenter.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import SwiftUI
import Combine

class HomeViewPresenter: HomePresenterProtocol, ObservableObject {
    
    var interactor: HomeInteractorProtocol
    @Published var genres: [GenresModel] = []
    private var cancellables = Set<AnyCancellable>()
    var router: HomeViewRouter?
    
    required init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
        self.router = HomeViewRouter()
        
        interactor.genresPublisher
            .assign(to: \.genres, on: self)
            .store(in: &cancellables)
    }
    
    func getGenres() {
        interactor.fetchGenresFromServer()
    }
    
    func navigate(for category: String, id: Int) -> some View {
        router?.goToMovieList(for: category, id: id)
    }
    
}
