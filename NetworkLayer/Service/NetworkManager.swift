//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 16.09.2023.
//https://jsonplaceholder.typicode.com/users
import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private func request<T : Decodable>(_ endpont:Endpoint, completion: @escaping ((Result<T, Error>) -> Void)) {
        let task = URLSession.shared.dataTask(with: endpont.request()) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 , response.statusCode <= 299 else {
                completion(.failure(NSError(domain: "Invalid Response", code: 0)))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Invalid Response", code: 0)))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch  {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    
    func getUser(completion : @escaping (Result<[User], Error>)->Void) {
        let endpoint = Endpoint.getUsers
        request(endpoint, completion: completion)
    }
    
    func getPost(completion : @escaping (Result<[Post], Error>)->Void) {
        let endpoint = Endpoint.getPosts
        request(endpoint, completion: completion)
    }
    func getComment(completion : @escaping (Result<[Comment], Error>)->Void) {
        let endpoint = Endpoint.getComments
        request(endpoint, completion: completion)
    }
    
}
