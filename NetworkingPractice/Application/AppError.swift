//
//  AppError.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 11/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

enum AppError: Error {
    case urlRequestError(error: Error)
    case noResponseError
    case redirectionError(code: Int)
    case clientError(code: Int)
    case serverError(code: Int)
    case unknownStatusCodeError
    case noDataError
}
