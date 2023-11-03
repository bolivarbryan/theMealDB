//
//  MealsPresenter.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import Foundation

class MealsPresenter: ViewToPresenterMealsProtocol, ObservableObject {

    // MARK: Properties
    var view: PresenterToViewMealsProtocol?
    var interactor: PresenterToInteractorMealsProtocol?
    var router: PresenterToRouterMealsProtocol?
    
    func fetchCategories() {
        interactor?.fetchCategories()
    }
    
    func selectCategory(_ category: String) {
        interactor?.fetchMeals(category)
    }
    
}

extension MealsPresenter: InteractorToPresenterMealsProtocol {
    func didFetchCategories(categories: [MealCategory]) {
        view?.reloadCategoriesSection(with: categories)
    }
    
    func didFailFetchingCategories(with error: TheMovieAPIError) {
        view?.presentError(error)
    }
    
    func didFetchMeals(meals: [Meal]) {
        view?.reloadMeals(with: meals)
    }
    
}
