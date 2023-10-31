//
//  TheMealDBAPI.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 31/10/23.
//

import Foundation
import Moya

public enum TheMealDBAPI {
    case fetchCategories
}

extension TheMealDBAPI: TargetType {

    public var baseURL: URL { return URL(string: "https://www.themealdb.com")! }

    public var path: String {
        switch self {
        case .fetchCategories:
            return "/api/json/v1/1/categories.php"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchCategories:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .fetchCategories:
            return .requestPlain
        }
    }

    public var headers: [String: String]? {
        return [:]
    }

    public var sampleData: Data {
        switch self {
        case .fetchCategories:
            return "{}".data(using: String.Encoding.utf8)!
        }
    }
}



