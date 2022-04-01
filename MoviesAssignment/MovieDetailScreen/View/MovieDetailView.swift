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
    @StateObject var presenter: MovieDetailPresenter
    @State var selectedVideo = ""
    @State private var isPresentVideo = false
    @State var isPresentReview = false
    
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
                        .font(.system(size: 18, weight: .ultraLight, design: .serif))
                        .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                        
                }
                .padding([.leading, .top], 20)
                Button {
                    self.isPresentReview = true
                } label: {
                    Text("See Review")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(.blue)
                        .cornerRadius(10)
                }
                .padding(.leading, 18)
                .padding(.top, 8)
                VStack (alignment: .leading) {
                    Text("Trailer")
                        .font(.title2)
                        .fontWeight(.bold)
                    if presenter.videos.count == 0 {
                        Text("No Videos Available")
                            .font(.system(size: 18, weight: .ultraLight, design: .serif))
                    }
                    ForEach(presenter.videos, id: \.id) { data in
                        Button {
                            self.selectedVideo = data.key
                        } label: {
                            HStack {
                                Text(data.name)
                                    .font(.system(size: 18, weight: .ultraLight, design: .serif))
                                    .foregroundColor(Color(AppConstants.defaultColor))
                                    .frame(width: 300, alignment: .leading)
                                Image(systemName: "play.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                        }
                    }
                }
                .padding([.leading, .top], 20)
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            .navigationTitle("")
            
            .onAppear(perform: {
                presenter.getVideo(for: movieInfo.id)
            })
            .onChange(of: self.selectedVideo, perform: { newValue in
                isPresentVideo = true
            })
            .sheet(isPresented: $isPresentVideo, content: {
                SafariView(key: selectedVideo)
            })
            .sheet(isPresented: $isPresentReview, content: {
                ReviewListView(presenter: presenter, movieId: movieInfo.id, isShowPage: $isPresentReview)
            })
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = MovieDetailInteractor(reviews: [], videos: [MovieVideo(id: "", key: "GfbNLLcrItI", name: "Catching Up with Jamie Foxx")])
        return NavigationView {
            MovieDetailView(movieInfo: MoviePrimaryInfo(id: 1, originalTitle: "Spider-Man: No Way Home", overview: "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda.", imagePath: "/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg", releaseDate: "2021-12-15", voteAvg: 8.2), presenter: MovieDetailPresenter(interactor: interactor))
        }
        .previewInterfaceOrientation(.portrait)
    }
}
