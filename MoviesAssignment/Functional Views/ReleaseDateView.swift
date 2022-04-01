//
//  ReleaseDateView.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 31/03/22.
//

import SwiftUI

struct ReleaseDateView: View {
    var relaseDate: String
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Release Date")
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(.gray)
            Text(relaseDate.convertToNewFormat(from: "YYYY-MM-dd"))
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
        .padding(10)
        .frame(height: 69)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.4), radius: 4, x: 1, y: 3)
    }
}

struct ReleaseDateView_Previews: PreviewProvider {
    static var previews: some View {
        ReleaseDateView(relaseDate: "2022-03-09")
    }
}
