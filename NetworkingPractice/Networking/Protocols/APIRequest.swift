//
//  APIRequest.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 09/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

typealias RequestHeaders = [String : String]
typealias RequestParameters = [String : String]

protocol APIRequest {
    associatedtype Response: Decodable
    associatedtype Body: Encodable

    var path: String { get }
    var method: RequestMethod { get }
    var headers: RequestHeaders? { get }
    var parameters: RequestParameters? { get }
    var body: Body? { get }
}

extension APIRequest {
    var headers: RequestHeaders? { nil }
    var parameters: RequestParameters? { nil }
    var body: String? { nil }
}

enum RequestMethod: String {
    case GET = "GET"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case POST = "POST"
    case DELETE = "DELETE"
}

struct ResponseResult: Decodable {}
