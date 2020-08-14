//
//  GetPosts.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 09/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct GETPosts: APIRequest {

    typealias Response = [Post]

    var path: String { "posts" }

    var method: RequestMethod { .GET }

    var parameters: RequestParameters?

    init(parameters: [String: String]? = nil) {
        self.parameters = parameters
    }
    
}
