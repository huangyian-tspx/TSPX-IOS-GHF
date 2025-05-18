//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Huang Yi An on 15/5/25.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    let cache         = NSCache<NSString, UIImage>()
    let baseURL       = "https://api.github.com/users/"
    
    private init () {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[FollowerModel], GFError>) -> Void) {
        let endpoint = baseURL +  "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.dataError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([FollowerModel].self, from: data)
                completed(.success(followers))
                
            }
            catch {
                completed(.failure(.dataError))
            }
            
        }
        
        task.resume()
        
    }
}

