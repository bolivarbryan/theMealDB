//
//  MealsRouter.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import Foundation
import UIKit

class MealsRouter: PresenterToRouterMealsProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = MealsViewController()
        
        let presenter: ViewToPresenterMealsProtocol & InteractorToPresenterMealsProtocol = MealsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MealsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MealsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
