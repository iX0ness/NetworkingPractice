//
//  NetworkingClient.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 11/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

struct NetworkingClient: APIClient {

    let session: URLSession
    let environment: AppEnvironment

    init(session: URLSession, environment: AppEnvironment) {
        self.session = session
        self.environment = environment
    }

    func send<T: APIRequest>(_ request: T, completion: @escaping CompletionHandler<T.Response>) -> URLSessionDataTask? {

        guard var request = constructURLRequest(for: request) else {
            return nil
        }

        environment.headers.forEach { (headerKey, value) in
            request.addValue(value, forHTTPHeaderField: headerKey)
        }

        let task = session.dataTask(with: request) { data, response, error in

            if let error = error {
                completion(.failure(AppError.urlRequestError(error: error)))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion(.failure(AppError.noResponseError))
                return
            }

            if let responseError = self.handleResponse(response) {
                completion(.failure(responseError))
                return
            }


            guard let data = data else {
                completion(.failure(AppError.noDataError))
                return
            }

            do {

                let responseString = String(data: data, encoding: .utf8)!
                print(responseString)

                let decodedObject = try JSONDecoder().decode(T.Response.self, from: data)
                completion(.success(decodedObject))
                
            } catch {
                debugFailure(items: error)
            }

        }
        task.resume()
        return task
    }

}

fileprivate extension NetworkingClient {

    func handleResponse(_ response: HTTPURLResponse) -> AppError? {
        switch response.statusCode {
        case 200...299:
            debugSuccess(items: "Response code: \(response.statusCode)")
            return nil
        case 300...399:
            debugFailure(items: "Response code: \(response.statusCode)")
            return AppError.redirectionError(code: response.statusCode)
        case 400...499:
            debugFailure(items: "Response code: \(response.statusCode)")
            return AppError.clientError(code: response.statusCode)
        case 500...599:
            debugFailure(items: "Response code: \(response.statusCode)")
            return AppError.serverError(code: response.statusCode)
        default:
            debugFailure(items: "Response code: \(response.statusCode)")
            return AppError.unknownStatusCodeError
        }
    }



}


