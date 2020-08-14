//
//  DeletePost.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 14/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct DELETEPost: APIRequest {

    typealias Response = ResponseResult

    var path: String = "posts/"

    var method: RequestMethod { .DELETE }

    init(postID: Int) {
        self.path += String(postID)
    }
    
}
