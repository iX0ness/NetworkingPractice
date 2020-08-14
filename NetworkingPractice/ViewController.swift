//
//  ViewController.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 09/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var environment: AppEnvironment  { .development }
    var session: URLSession { .init(configuration: .default) }

    override func viewDidLoad() {
        super.viewDidLoad()

        let getPosts = RequestsStorage.getPosts()
        let getPostsByTitle = RequestsStorage.getPosts(parameters: [.title: "nesciunt quas odio"])
        let getPostById = RequestsStorage.getPost(by: 2)

        let putPost = RequestsStorage.updateOrCreateIfNotExist(by: 2, putRequestPost)
        let patchPost = RequestsStorage.updatePost(by: 2, patchRequestPost)
        let deletePost = RequestsStorage.deletePost(by: 2)

        let networkingClient = NetworkingClient(session: session, environment: environment)
        let _ = networkingClient.send(getPosts) { result in
            switch result {
            case .success(let posts):
                print(posts)
            case .failure(let error):
                print(error)
            }
        }
    }

    var putRequestPost: Post {
        Post(
            userID: 1,
            postID: 2,
            title: "Summer holidays",
            body: "Holidays in Spain"
        )
    }

    var patchRequestPost: Post {
        Post(
            title: "Winter holidays",
            body: "Holidays in Finland"
        )
    }

}
