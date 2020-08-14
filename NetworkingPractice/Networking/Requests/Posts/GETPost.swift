//
//  GetPost.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 13/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct GETPost: APIRequest {

    typealias Response = Post

    var path: String = "posts/"

    var method: RequestMethod { .GET }

    init(id: Int) {
        path += String(id)
    }
    
}
