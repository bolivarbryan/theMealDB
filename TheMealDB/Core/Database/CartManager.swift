//
//  CartManager.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 6/11/23.
//

import Foundation
import UIKit
import CoreData

struct CartManager {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static func addMeal(_ meal: Meal) {
        guard !containsMeal(meal) else {
            increaseMealCount(meal)
            return
        }
        
        let context = PricingManager.appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CartItem", in: context)
        let newMeal = NSManagedObject(entity: entity!, insertInto: context)
        newMeal.setValue(meal.id, forKey: "mealId")
        newMeal.setValue(meal.price, forKey: "mealPrice")
        newMeal.setValue(meal.name, forKey: "name")
        newMeal.setValue(meal.thumbnail, forKey: "thumbnail")
        newMeal.setValue(1, forKey: "quantity")
        do {
          try context.save()
            print("Meal Added")
         } catch {
          print("Error saving")
        }
    }
    
    static func increaseMealCount(_ meal: Meal) {
        let context = PricingManager.appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
        request.predicate = NSPredicate(format: "mealId = %@", meal.id)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            if let mealObject = result.first {
                let count = mealObject.value(forKey: "quantity") as! Int
                mealObject.setValue(count + 1, forKey: "quantity")
                try context.save()
                print("Increased Count")
            }
        } catch {
            print("Failed")
        }
    }
    
    static func decreaseMealCount(_ meal: Meal) {
        let context = PricingManager.appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
        request.predicate = NSPredicate(format: "mealId = %@", meal.id)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            if let mealObject = result.first {
                let count = mealObject.value(forKey: "quantity") as! Int
                
                if count == 1 {
                    context.delete(mealObject)
                    print("Deleted Meal")
                } else {
                    mealObject.setValue(count - 1, forKey: "quantity")
                    print("Decreased Meal")
                }
                try context.save()
            }
        } catch {
            print("Failed")
        }
    }

    static func getMeals() -> [MealItem] {
        let context = PricingManager.appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            print("DidFetch Cart")
            return result.map { object in
                var meal = Meal(id: object.value(forKey: "mealId") as! String,
                                name: object.value(forKey: "name") as! String,
                                thumbnail: object.value(forKey: "thumbnail") as! String)
                meal.price = object.value(forKey: "mealPrice") as! Int
                let quantity = object.value(forKey: "quantity") as! Int
                var mealItem = MealItem(meal: meal, quantity: quantity)
                return mealItem
            }
        } catch {
            print("Failed")
            return []
        }
    }
    
    static func containsMeal(_ meal: Meal) -> Bool {
        let context = PricingManager.appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
        request.predicate = NSPredicate(format: "mealId = %@", meal.id)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            let contailsMeal = result.first != nil
            print("Contails Meal, ", contailsMeal)
            return contailsMeal
        } catch {
            print("Failed")
            return false
        }
    }
    
    static func clearCart() {
        let context = PricingManager.appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            for object in result {
                context.delete(object)
            }
            try context.save()
        } catch {
            print("Failed")
        }
    }
    
}
