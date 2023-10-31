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
}

extension MealsPresenter: InteractorToPresenterMealsProtocol {
    
}
