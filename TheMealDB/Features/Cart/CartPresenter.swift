//
//  CartPresenter.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 6/11/23.
//  
//

import Foundation

class CartPresenter: ViewToPresenterCartProtocol {

    // MARK: Properties
    var view: PresenterToViewCartProtocol?
    var interactor: PresenterToInteractorCartProtocol?
    var router: PresenterToRouterCartProtocol?
    
    func getMealsFromCart() {
        interactor?.getMealsFromCart()
    }
    
    func increaseQuantityForMeal(_ meal: MealItem) {
        interactor?.increaseQuantityForMeal(meal)
    }
    
    func decreaseQuantityForMeal(_ meal: MealItem) {
        interactor?.decreaseQuantityForMeal(meal)
    }
    
    func completeCheckout() {
        interactor?.completeCheckout()
    }
    
}

extension CartPresenter: InteractorToPresenterCartProtocol {

    func didGetMealsFromCart(meals: [MealItem]) {
        view?.didGetMealsFromCart(meals: meals)
    }
    
    func didUpdateQuantity() {
        view?.didUpdateQuantity()
    }
    
    func didCompleteCheckout() {
        view?.didCompleteCheckout()
    }
}
