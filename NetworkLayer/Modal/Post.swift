//
//  Post.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 22.09.2023.
//

import Foundation


// MARK: - Post
struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
