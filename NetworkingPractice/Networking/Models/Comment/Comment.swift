//
//  Comment.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 13/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct Comment: Codable {
    let postID: Int
    let commentID: Int
    let title: String?
    let name: String?
    let email: String?
    let body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case commentID = "id"
        case title
        case name
        case email
        case body
    }
}
