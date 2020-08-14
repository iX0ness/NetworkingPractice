//
//  GetPostComments.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 13/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct GetPostComments: APIRequest {

    typealias Response = [Comment]

    var path: String

    var method: RequestMethod { .GET }

    init(postID: Int) {
        self.path = "posts/\(postID)/comments"
    }
    
}
