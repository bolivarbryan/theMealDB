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
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMealsProtocol {
    
    var view: PresenterToViewMealsProtocol? { get set }
    var interactor: PresenterToInteractorMealsProtocol? { get set }
    var router: PresenterToRouterMealsProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMealsProtocol {
    
    var presenter: InteractorToPresenterMealsProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMealsProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMealsProtocol {
    
}
