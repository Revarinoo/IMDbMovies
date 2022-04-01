//
//  SafariView.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 01/04/22.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    let key: String
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        return
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let url = URL(string: AppConstants.baseVideoURL + key)!
        let safariVC = SFSafariViewController(url: url)
        return safariVC
    }
    
}
