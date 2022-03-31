//
//  GenreView.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import SwiftUI

struct GenreView: View {
    var name: String
    
    var body: some View {
        Text(name)
            .frame(maxWidth: 125)
            .font(.system(size: 18, weight: .medium, design: .monospaced))
            .foregroundColor(Color(AppConstants.defaultColor))
            .frame(width: (UIScreen.main.bounds.width / 2) - 16, height: 70)
            .background(.white)
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 1, y: 2)
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView(name: "Science Fiction")
    }
}
