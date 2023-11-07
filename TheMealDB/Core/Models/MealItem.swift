//
//  MealItem.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 6/11/23.
//

import Foundation

struct MealItem: Identifiable {
    let meal: Meal
    var quantity: Int
    
    var id: String {
        return meal.id
    }
}
