//
//  MealContract.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMealProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMealProtocol {
    
    var view: PresenterToViewMealProtocol? { get set }
    var interactor: PresenterToInteractorMealProtocol? { get set }
    var router: PresenterToRouterMealProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMealProtocol {
    
    var presenter: InteractorToPresenterMealProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMealProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMealProtocol {
    
}
