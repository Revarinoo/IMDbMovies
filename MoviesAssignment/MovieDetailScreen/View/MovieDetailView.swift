//
//  MovieDetailView.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 31/03/22.
//

import SwiftUI

struct MovieDetailView: View {
    var movieInfo: MoviePrimaryInfo
    @ObservedObject var presenter: MovieDetailPresenter
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = MovieDetailInteractor(reviews: [], videos: [])
        return NavigationView {
            MovieDetailView(movieInfo: MoviePrimaryInfo(id: 1, originalTitle: "Spider-Man: No Way Home", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", imagePath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg", releaseDate: "2021-12-15", voteAvg: 8.2), presenter: MovieDetailPresenter(interactor: interactor))
        }
    }
}
