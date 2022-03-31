//
//  ContentView.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView(presenter: HomeViewPresenter(interactor: HomeViewInteractor(genres: [])))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
