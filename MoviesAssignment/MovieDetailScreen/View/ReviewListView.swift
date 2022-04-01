//
//  ReviewListView.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 01/04/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReviewListView: View {
    @ObservedObject var presenter: MovieDetailPresenter
    let movieId: Int
    @Binding var isShowPage: Bool
    @State private var nextPage = 2
    
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack (spacing: 20) {
                    ForEach(presenter.reviews, id: \.id) { data in
                        Divider()
                        HStack (alignment: .top, spacing: 15) {
                            VStack {
                                WebImage(url: data.authorDetail.avatarURL)
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .clipShape(Circle())
                                Text(data.authorDetail.username)
                                    .font(.headline)
                                    .frame(width: 100)
                                    .multilineTextAlignment(.center)
                                Text(data.updatedAt.convertToNewFormat(from: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"))
                                    .font(.caption)
                                    .padding(.top, 1)
                            }
                            Text(data.content)
                                .font(.system(size: 14, weight: .regular, design: .serif))
                                .frame(width: UIScreen.main.bounds.width/2, alignment: .leading)
                        }
                        .onAppear {
                            let index = presenter.reviews.firstIndex(of: data)
                            if index == presenter.reviews.count - 2 {
                                presenter.getReviews(for: movieId, page: nextPage)
                                nextPage += 1
                            }
                        }
                    }
                }
            }
            .navigationTitle("Reviews")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem (placement: .navigationBarLeading) {
                    Button {
                        isShowPage.toggle()
                    } label: {
                        Text("Done")
                    }

                }
            })
            .onAppear {
                presenter.getReviews(for: movieId, page: 1)
            }
        }
    }
}

struct ReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = MovieDetailInteractor(reviews: [MovieReview(id: "", authorDetail: Author(username: "Canadian Oranges", avatar: ""), content: "Full Analysis at Spotamovie.com - **Intro** - Pixar’s movies usually have great insights, and even with Turning Red, they provided us with meaningful messages to help our children and us grow our personalities and mindset. - **The Story** - Meilin is an energetic teenager ready to walk into the grown-up world. However, she needs to wear a mask when she is with her parents and another one when she is at school and with her friends. The risk to disappoint her family is too big for Meilin. But something unexpected will happen. Meilin’s life will change drastically because of a secret that lives within her family. When Meilin can’t control her emotions, a new version of herself will appear. But can you hold your feelings? - **Full Analysis and Explanation at** https://www.spotamovie.com/turning-red-review-and-explanation-critic-post-movie-disney-movie-2022", updatedAt: "2022-03-20T21:04:07.947Z")], videos: [])
        return NavigationView {
            ReviewListView(presenter: MovieDetailPresenter(interactor: interactor), movieId: 1, isShowPage: .constant(true))
        }
    }
}
