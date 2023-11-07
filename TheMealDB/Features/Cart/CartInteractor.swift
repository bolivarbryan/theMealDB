//
//  CartInteractor.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 6/11/23.
//  
//

import Foundation

class CartInteractor: PresenterToInteractorCartProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterCartProtocol?
    
    func getMealsFromCart() {
        presenter?.didGetMealsFromCart(meals: CartManager.getMeals())
    }
    
    func increaseQuantityForMeal(_ meal: MealItem) {
        CartManager.increaseMealCount(meal.meal)
        presenter?.didUpdateQuantity()
    }
    
    func decreaseQuantityForMeal(_ meal: MealItem) {
        CartManager.decreaseMealCount(meal.meal)
        presenter?.didUpdateQuantity()
    }
    
    func completeCheckout() {
        CartManager.clearCart()
        presenter?.didCompleteCheckout()
    }
}
