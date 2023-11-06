//
//  MealsContract.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMealsProtocol {
    func reloadCategoriesSection(with categories: [MealCategory])
    func presentError(_ error: TheMovieAPIError)
    func reloadMeals(with meals: [Meal])
    func didAddMealToCart()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMealsProtocol {
    
    var view: PresenterToViewMealsProtocol? { get set }
    var interactor: PresenterToInteractorMealsProtocol? { get set }
    var router: PresenterToRouterMealsProtocol? { get set }
    
    func fetchCategories()
    func selectCategory(_ category: String)
    func addMealToCart(meal: Meal)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMealsProtocol {
    
    var presenter: InteractorToPresenterMealsProtocol? { get set }
 
    func fetchCategories()
    func fetchMeals(_ category: String)
    func addMealToCart(meal: Meal)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMealsProtocol {
    func didFetchCategories(categories: [MealCategory])
    func didFailFetchingCategories(with error: TheMovieAPIError)
    func didFetchMeals(meals: [Meal])
    func didAddMealToCart()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMealsProtocol {
    
}
