//
//  Comment.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 22.09.2023.
//

import Foundation


// MARK: - Comment
struct Comment: Codable {
    let postID:Int
    let id:Int
    let name:String
    let email:String
    let body:String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
