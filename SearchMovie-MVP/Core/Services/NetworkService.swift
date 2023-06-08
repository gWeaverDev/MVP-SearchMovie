//
//  NetworkService.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 08.06.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol
{
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                let model = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
    
}
