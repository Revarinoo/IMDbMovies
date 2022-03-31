//
//  String+Extensions.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 31/03/22.
//

import Foundation

extension String {
    func convertToNewFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let oldFormat = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: oldFormat!)
    }
}
