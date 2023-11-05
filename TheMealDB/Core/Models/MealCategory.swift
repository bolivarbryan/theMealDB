//
//  MealCategory.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//

import Foundation

private let expensiveCategories: [String] = ["Lamb"]
private let mediumCategories: [String] = ["Beef"]
private let cheaperCategories: [String] = ["Pork"]

public struct MealCategory: Codable, Identifiable, Hashable {
    public var id: String
    public let name: String
    public let thumbnail: String
    public let description: String
    private var meals: Set<Meal> = []
    
    public enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnail = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
    
    func generatePrice() -> Int {
        if expensiveCategories.contains(name) {
            return PriceType.high.generatePrice()
        } else if mediumCategories.contains(name) {
            return PriceType.medium.generatePrice()
        } else if cheaperCategories.contains(name) {
            return PriceType.low.generatePrice()
        } else {
            return PriceType.any.generatePrice()
        }
    }
    
    func categoryMeals() -> [Meal] {
        return Array(self.meals)
    }
}

extension MealCategory: Optionable {
    var optionValue: String {
        return name
    }
}

