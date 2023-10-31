//
//  TheMovieAPIError.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 31/10/23.
//

import Foundation

enum TheMovieAPIError: String, Error {
    case notFound = "The URL provided does not exist"
    case internalError = "Internal Error"
    case decodingError = "Failed to decode response"
}
