//
//  HomeView.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: HomeViewPresenter
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16, content: {
                ForEach(presenter.genres, id: \.id) { genre in
                    NavigationLink(destination: presenter.navigate(for: genre.name, id: genre.id)) {
                        withAnimation {
                            GenreView(name: genre.name)
                        }
                    }
                }
            })
            .padding([.leading, .trailing], 8)
            .padding(.top, 20)
        }
        .navigationTitle("Movie Genres")
        .navigationBarTitleDisplayMode(.automatic)
        .onAppear {
            presenter.getGenres()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = HomeViewInteractor(genres: [GenresModel(id: 1, name: "Action"), GenresModel(id: 2, name: "Drama"), GenresModel(id: 3, name: "Animation")])
        let presenter = HomeViewPresenter(interactor: interactor)
        return NavigationView {
            HomeView(presenter: presenter)
        }
    }
}
