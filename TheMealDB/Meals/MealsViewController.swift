//
//  MealsViewController.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import UIKit

class MealsViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterMealsProtocol?
    
}

extension MealsViewController: PresenterToViewMealsProtocol{
    // TODO: Implement View Output Methods
}
