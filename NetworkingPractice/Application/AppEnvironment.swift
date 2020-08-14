//
//  AppEnvironment.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 11/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

enum AppEnvironment {
    case development

    // TODO: Extend in case of new url targets

    var baseURLString: String {
        switch self {
        case .development: return "https://jsonplaceholder.typicode.com/"

        }
    }

    var headers: [String: String] {
        switch self {
        case .development:
            return [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ]
        }
    }
}
