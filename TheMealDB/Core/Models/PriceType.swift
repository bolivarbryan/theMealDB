//
//  PriceType.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 5/11/23.
//

import Foundation

enum PriceType {
    case high
    case medium
    case low
    case any
    
    func generatePrice() -> Int {
        switch self {
        case .high: Int.random(in: 60..<100)
        case .medium: Int.random(in: 30..<59)
        case .low: Int.random(in: 1..<29)
        case .any: Int.random(in: 1..<100)
        }
    }
}
