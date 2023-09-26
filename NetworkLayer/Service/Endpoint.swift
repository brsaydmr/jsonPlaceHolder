//
//  Endpoint.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 16.09.2023.
//https://jsonplaceholder.typicode.com/users

import Foundation

protocol EndpointProtocol {
    var baseURL: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var header: [String : String]? {get}
    
    func request() -> URLRequest
}
enum HTTPMethod:String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case path = "PATH"
}
enum Endpoint {
    case getUsers
    case getPosts
    case getComments
}
extension Endpoint:EndpointProtocol {
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .getPosts:
            return "/posts"
        case .getComments:
            return "/comments"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        case .getPosts:
            return .get
        case .getComments:
            return .get
        }
    }
    var header: [String : String]? {
        return nil
    }
    func request() -> URLRequest {
        guard var component = URLComponents(string: baseURL) else {
            fatalError("URL Error")
        }
        component.path = path
        var request = URLRequest(url: component.url!)
        request.httpMethod = method.rawValue
        
        if let header = header {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
}
