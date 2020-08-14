//
//  SendPost.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 12/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct POSTPost: APIRequest {

    typealias Response = Post

    typealias Body = Post

    var path: String { "posts" }

    var method: RequestMethod { .POST }

    var body: Post?

    init(body: Post) {
        self.body = body
    }
    
}
