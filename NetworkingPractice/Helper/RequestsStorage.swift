//
//  RequestConfigurator.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 12/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct RequestsStorage {
    static func getPosts(parameters: [PostParameters: String]? = nil) -> GETPosts {

        guard let parameters = parameters else { return GETPosts() }
        var requestParameters = [String: String]()
        parameters.forEach {
            requestParameters[$0.key.rawValue] = $0.value
        }

        return GETPosts(parameters: requestParameters)
    }

    static func getPost(by postId: Int) -> GETPost {
        GETPost(id: postId)
    }

    static func sendPost(_ post: Post) -> POSTPost {
        POSTPost(body: post)
    }

    static func updateOrCreateIfNotExist(by postID: Int, _ post: Post) -> PUTPost {
        PUTPost(postID: postID, body: post)
    }

    static func updatePost(by postID: Int, _ post: Post) -> PATCHPost {
        PATCHPost(postID: postID, body: post)
    }

    static func deletePost(by postID: Int) -> DELETEPost {
        DELETEPost(postID: postID)
    }
}










enum PostParameters: String {
    case userId = "userId"
    case id = "id"
    case title = "title"
    case body = "body"
}
