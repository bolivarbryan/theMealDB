//
//  MealPresenter.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import Foundation

class MealPresenter: ViewToPresenterMealProtocol {

    // MARK: Properties
    var view: PresenterToViewMealProtocol?
    var interactor: PresenterToInteractorMealProtocol?
    var router: PresenterToRouterMealProtocol?
}

extension MealPresenter: InteractorToPresenterMealProtocol {
    
}
