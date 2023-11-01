//
//  MealCategory.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//

import Foundation

struct MealCategory: Codable, Identifiable {
    var id: String
    let name: String
    let thumbnail: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnail = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}

extension MealCategory: Optionable {
    var optionValue: String {
        return name
    }
}
