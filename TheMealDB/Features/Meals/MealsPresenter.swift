//
//  MealsPresenter.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import Foundation

class MealsPresenter: ViewToPresenterMealsProtocol {

    // MARK: Properties
    var view: PresenterToViewMealsProtocol?
    var interactor: PresenterToInteractorMealsProtocol?
    var router: PresenterToRouterMealsProtocol?
    
    func fetchCategories() {
        interactor?.fetchCategories()
    }
    
}

extension MealsPresenter: InteractorToPresenterMealsProtocol {
    func didFetchCategories(categories: [MealCategory]) {
        view?.reloadCategoriesSection(with: categories)
    }
    
    func didFailFetchingCategories(with error: Error) {
        view?.presentError(error)
    }
    
    
}
