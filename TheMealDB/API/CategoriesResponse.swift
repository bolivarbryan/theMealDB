//
//  CategoriesResponse.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 31/10/23.
//

import Foundation

struct CategoriesResponse: Codable {
    let categories: [MealCategory]
}

struct MealsResponse: Codable {
    let meals: [Meal]
}
