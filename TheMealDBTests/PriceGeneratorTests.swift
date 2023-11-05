//
//  PriceGeneratorTests.swift
//  TheMealDBTests
//
//  Created by Bryan A Bolivar M on 5/11/23.
//

import XCTest
import TheMealDB

final class PriceGeneratorTests: XCTestCase {
    private static let beefMock = """
        { "idMeal": "1", "strMeal": "Beef Dish", "strMealThumb": "" }
        """.data(using: .utf8)!
    
    private static let porkMock = """
        { "idMeal": "2", "strMeal": "Pork Dish", "strMealThumb": "" }
        """.data(using: .utf8)!
    
    private static let lambMock = """
        { "idMeal": "3", "strMeal": "Lamb Dish", "strMealThumb": "" }
        """.data(using: .utf8)!
    
    private static let beefCategoryMock =  """
            {"idCategory": "1", "strCategory": "Beef", "strCategoryThumb": "",  "strCategoryDescription": ""}
            """.data(using: .utf8)!
    
    private static let porkCategoryMock =  """
            {"idCategory": "2", "strCategory": "Pork", "strCategoryThumb": "",  "strCategoryDescription": ""}
            """.data(using: .utf8)!
    
    private static let lambCategoryMock =  """
            {"idCategory": "3", "strCategory": "Lamb", "strCategoryThumb": "",  "strCategoryDescription": ""}
            """.data(using: .utf8)!
    
    override class func setUp() {}

    func testBeefMealPriceIsHigherThanPork() {
        //GIVEN
        var beef = try! JSONDecoder().decode(Meal.self, from: PriceGeneratorTests.beefMock)
        var beefCategories = try! JSONDecoder().decode(MealCategory.self, from: PriceGeneratorTests.beefCategoryMock)
        beefCategories.addMeal(&beef)
        
        //WHEN
        var pork = try! JSONDecoder().decode(Meal.self, from: PriceGeneratorTests.porkMock)
        var porkCategories = try! JSONDecoder().decode(MealCategory.self, from: PriceGeneratorTests.porkCategoryMock)
        porkCategories.addMeal(&pork)
        
        //THEN
        XCTAssertTrue(beef.price > pork.price)
    }
    
    func testLambMealPriceIsHigherThanPork() {
        //GIVEN
        var lamb = try! JSONDecoder().decode(Meal.self, from: PriceGeneratorTests.lambMock)
        var lambCategories = try! JSONDecoder().decode(MealCategory.self, from: PriceGeneratorTests.beefCategoryMock)
        lambCategories.addMeal(&lamb)
        
        //WHEN
        var pork = try! JSONDecoder().decode(Meal.self, from: PriceGeneratorTests.porkMock)
        var porkCategories = try! JSONDecoder().decode(MealCategory.self, from: PriceGeneratorTests.porkCategoryMock)
        porkCategories.addMeal(&pork)
        
        //THEN
        XCTAssertTrue(lamb.price > pork.price)
    }
    
    func testLambMealPriceIsHigherThanBeef() {
        //GIVEN
        var lamb = try! JSONDecoder().decode(Meal.self, from: PriceGeneratorTests.lambMock)
        var lambCategories = try! JSONDecoder().decode(MealCategory.self, from: PriceGeneratorTests.lambCategoryMock)
        lambCategories.addMeal(&lamb)
        
        //WHEN
        var beef = try! JSONDecoder().decode(Meal.self, from: PriceGeneratorTests.beefMock)
        var beefCategories = try! JSONDecoder().decode(MealCategory.self, from: PriceGeneratorTests.beefCategoryMock)
        beefCategories.addMeal(&beef)
        
        //THEN
        XCTAssertTrue(lamb.price > beef.price)
    }
}
