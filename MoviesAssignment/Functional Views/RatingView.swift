//
//  RatingView.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 31/03/22.
//

import SwiftUI

struct RatingView: View {
    var rating: Double
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text("IMDb RATING")
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(.gray)
            HStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 20, height: 20)
                HStack (spacing: 0) {
                    Text(String(rating) + " / ")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                    Text("10")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
            }
        }
        .padding(10)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.4), radius: 4, x: 1, y: 3)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 8.5)
    }
}
