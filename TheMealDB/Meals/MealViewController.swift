//
//  MealViewController.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import UIKit

class MealViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterMealProtocol?
    
}

extension MealViewController: PresenterToViewMealProtocol{
    // TODO: Implement View Output Methods
}
