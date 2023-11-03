//
//  Meal.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//

import Foundation

struct Meal: Codable {
    let id: String
    let name: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}
