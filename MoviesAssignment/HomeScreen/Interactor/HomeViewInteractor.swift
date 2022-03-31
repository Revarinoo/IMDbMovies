//
//  HomeViewInteractor.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import Foundation

class HomeViewInteractor: HomeInteractorProtocol {
    var genresPublished: Published<[GenresModel]> { _genres }
    var genresPublisher: Published<[GenresModel]>.Publisher { $genres }
    @Published var genres: [GenresModel]
    
    init(genres: [GenresModel]) {
        self.genres = genres
    }
    
    func fetchGenresFromServer() {
        guard let url = URL(string: AppConstants.baseURL + "genre/movie/list" + AppConstants.apiKey) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        ApiManager.shared.request(urlRequest, resultType: GenresResponse.self) { result in
            guard let result = result else {
                return
            }
            DispatchQueue.main.async { [unowned self] in
                for data in result.genres {
                    self.genres.append(data)
                }
            }
        }
    }
}
