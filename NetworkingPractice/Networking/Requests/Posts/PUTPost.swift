//
//  UpdatePost.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 13/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct PUTPost: APIRequest {

    typealias Response = Post

    typealias Body = Post

    var path: String = "posts/"

    var method: RequestMethod { .PUT }

    var body: Post?

    init(postID: Int, body: Body) {
        self.path += String(postID)
        self.body = body
    }
    
}
