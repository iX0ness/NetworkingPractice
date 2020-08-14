//
//  APIClient.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 09/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

typealias CompletionHandler<Value> = (Result<Value, AppError>) -> Void

protocol APIClient {
    var session: URLSession { get }
    var environment: AppEnvironment { get }

    func send<T: APIRequest>(_ request: T, completion: @escaping CompletionHandler<T.Response>) -> URLSessionDataTask?
}

extension APIClient {

    func constructURLRequest<T: APIRequest>(for request: T) -> URLRequest? {
        guard let url = url(for: request) else {
            return nil

        }
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = jsonBody(for: request)
        return urlRequest
    }

    private func url<T: APIRequest>(for request: T) -> URL? {
        guard var components = URLComponents(string: environment.baseURLString) else { return nil }

        components.queryItems = queryParameters(for: request)
        components.path += request.path
        return components.url
    }

    private func queryParameters<T: APIRequest>(for request: T) -> [URLQueryItem]? {
        guard
            request.method == .GET,
            let parameters = request.parameters else { return nil }
        return parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }

    private func jsonBody<T: APIRequest>(for request: T) -> Data? {
        guard [.POST, .PUT, .PATCH].contains(request.method) else { return nil }

        var body: Data?

        do {
            body = try JSONEncoder().encode(request.body)

            let responseString = String(data: body!, encoding: .utf8)!
            print(responseString)
        } catch {
            debugFailure(items: error)
        }

        return body
    }
}
