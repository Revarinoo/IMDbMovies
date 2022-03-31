//
//  ApiManager.swift
//  MoviesAssignment
//
//  Created by Revarino Putra on 30/03/22.
//

import Foundation

final class ApiManager {
    static let shared = ApiManager()
    
    private init(){}

    func request<T:Decodable>(_ request: URLRequest, resultType:T.Type, completionHandler:@escaping(_ result: T?)-> Void) {

        URLSession.shared.dataTask(with: request) { data, response, error in
            if(error == nil && data != nil) {
                let responses = try? JSONDecoder().decode(resultType.self, from: data!)
                completionHandler(responses)
            }
            if (error != nil) {
                print("error")
            }
        }.resume()
    }
}
