//
//  MoviewListView.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var presenter: MovieListPresenter
    var category: String
    let column = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    var nextPage = 2
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            LazyVGrid(columns: column, spacing: 20) {
                ForEach(presenter.movies, id: \.id) { data in
                    MovieCardView(imageURL: data.imagePath, title: data.originalTitle)
                }
            }.padding([.leading, .trailing], 16)
            
        }
        .padding(.top, 30)
        .navigationTitle(category)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            presenter.getMovieInfo(for: category, page: 1)
        }
    }
}

struct MoviewListView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = MovieListInteractor(movies: [MoviePrimaryInfo(id: 1, originalTitle: "Turning Red", overview: "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda.", imagePath: "/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg", releaseDate: "2022-03-01", voteAvg: 7.5)])
        let presenter = MovieListPresenter(interactor: interactor, movies: [])
        return NavigationView {
            MovieListView(presenter: presenter, category: "Action")
        }
    }
}
