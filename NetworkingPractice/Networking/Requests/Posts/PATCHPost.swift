//
//  UpdatePost.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 14/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct PATCHPost: APIRequest {

    typealias Response = Post

    typealias Body = Post

    var path: String = "posts/"

    var method: RequestMethod { .PATCH }

    var body: Post?

    init(postID: Int, body: Post) {
        self.path += String(postID)
        self.body = body
    }

}
