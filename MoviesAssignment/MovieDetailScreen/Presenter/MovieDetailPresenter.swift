//
//  MovieDetailPresenter.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 31/03/22.
//

import Combine

class MovieDetailPresenter: MovieDetailPresenterProtocol, ObservableObject {
    @Published var reviews: [MovieReview] = []
    @Published var videos: [MovieVideo] = []
    var interactor: MovieDetailInteractorProtocol
    private var cancellables = Set<AnyCancellable>()
    
    required init(interactor: MovieDetailInteractorProtocol) {
        self.interactor = interactor
        
        interactor.reviewPublisher
            .assign(to: \.reviews, on: self)
            .store(in: &cancellables)
        
        interactor.videoPublisher
            .assign(to: \.videos, on: self)
            .store(in: &cancellables)
    }
    
    func getReviews(for id: Int, page: Int) {
        interactor.fetchReviews(for: id, page: page)
    }
    
    func getVideo(for id: Int) {
        interactor.fetchVideo(for: id)
    }
}
