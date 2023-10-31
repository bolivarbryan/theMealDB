//
//  MealRouter.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import Foundation
import UIKit

class MealRouter: PresenterToRouterMealProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = MealViewController()
        
        let presenter: ViewToPresenterMealProtocol & InteractorToPresenterMealProtocol = MealPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MealRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MealInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
