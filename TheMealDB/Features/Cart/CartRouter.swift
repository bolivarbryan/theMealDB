//
//  CartRouter.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 6/11/23.
//  
//

import Foundation
import UIKit

class CartRouter: PresenterToRouterCartProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = CartViewController()
        
        let presenter: ViewToPresenterCartProtocol & InteractorToPresenterCartProtocol = CartPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CartRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CartInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
