//
//  Meal.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//

import Foundation

public struct Meal: Codable, Hashable {
    public let id: String
    public let name: String
    public let thumbnail: String
    
    public var category: MealCategory? = nil {
        didSet {
            guard let category = category else {
                return
            }
            
            price = category.generatePrice()
        }
    }
    public var price: Int = 0
    
    public enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}
