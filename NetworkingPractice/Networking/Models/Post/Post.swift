//
//  Post.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 09/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct Post: Codable {
    let userID: Int?
    let postID: Int?
    let title: String?
    let body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case postID = "id"
        case title
        case body
    }

    init(userID: Int? = nil, postID: Int? = nil, title: String? = nil, body: String? = nil) {
        self.userID = userID
        self.postID = postID
        self.title = title
        self.body = body
    }

}
