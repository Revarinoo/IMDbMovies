//
//  MovieDetailView.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 31/03/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    var movieInfo: MoviePrimaryInfo
    @ObservedObject var presenter: MovieDetailPresenter
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text(movieInfo.originalTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                WebImage(url: URL(string: AppConstants.baseImageURL + movieInfo.imagePath))
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                HStack(spacing: 20) {
                    RatingView(rating: movieInfo.voteAvg)
                    ReleaseDateView(relaseDate: movieInfo.releaseDate)
                }
                .padding(.leading, 20)
                VStack (alignment: .leading, spacing: 9) {
                    Text("Overview")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(movieInfo.overview)
                        .font(.body)
                        .fontWeight(.regular)
                        .frame(width: UIScreen.main.bounds.width - 35, alignment: .leading)
                        
                        
                }
                .padding(.leading, 20)
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = MovieDetailInteractor(reviews: [], videos: [])
        return NavigationView {
            MovieDetailView(movieInfo: MoviePrimaryInfo(id: 1, originalTitle: "Spider-Man: No Way Home", overview: "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda.", imagePath: "/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg", releaseDate: "2021-12-15", voteAvg: 8.2), presenter: MovieDetailPresenter(interactor: interactor))
        }
        .previewInterfaceOrientation(.portrait)
    }
}
