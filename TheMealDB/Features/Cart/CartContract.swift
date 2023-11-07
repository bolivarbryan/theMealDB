//
//  CartContract.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 6/11/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewCartProtocol {
    func didGetMealsFromCart(meals: [MealItem])
    func didUpdateQuantity()
    func didCompleteCheckout()
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCartProtocol {
    
    var view: PresenterToViewCartProtocol? { get set }
    var interactor: PresenterToInteractorCartProtocol? { get set }
    var router: PresenterToRouterCartProtocol? { get set }
    
    func getMealsFromCart()
    func increaseQuantityForMeal(_ meal: MealItem)
    func decreaseQuantityForMeal(_ meal: MealItem)
    func completeCheckout()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCartProtocol {
    
    var presenter: InteractorToPresenterCartProtocol? { get set }
    
    func getMealsFromCart()
    func increaseQuantityForMeal(_ meal: MealItem)
    func decreaseQuantityForMeal(_ meal: MealItem)
    func completeCheckout()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCartProtocol {
    func didGetMealsFromCart(meals: [MealItem])
    func didUpdateQuantity()
    func didCompleteCheckout()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCartProtocol {
    
}
