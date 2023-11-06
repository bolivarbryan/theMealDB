//
//  PricingManager.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 6/11/23.
//

import Foundation
import CoreData
import UIKit

struct PricingManager {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static func getPrice(from meal: Meal) -> Int? {
        let context = PricingManager.appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MealPrice")
        request.predicate = NSPredicate(format: "mealId = %@", meal.id)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            return result.first?.value(forKey: "mealPrice") as? Int
        } catch {
            print("Failed")
            return nil
        }
    }
    
    static func setPrice(for meal: Meal) {
        let context = PricingManager.appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MealPrice", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(meal.id, forKey: "mealId")
        newUser.setValue(meal.price, forKey: "mealPrice")
        do {
          try context.save()
         } catch {
          print("Error saving")
        }
    }
}
