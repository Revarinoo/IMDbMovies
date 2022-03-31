//
//  MovieCardView.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 31/03/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCardView: View {
    var imageURL: String
    var title: String
    
    var body: some View {
        VStack (spacing: 26) {
            WebImage(url: URL(string: AppConstants.baseImageURL + imageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 200)
            Text(title)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(Color(AppConstants.defaultColor))
                .frame(width: 180 - 32, height: 45)
        }
        .padding(.bottom, 16)
        .frame(width: 160)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.4), radius: 4, x: 1, y: 1)
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(imageURL: "/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg", title: "Spiderman no way home")
    }
}
