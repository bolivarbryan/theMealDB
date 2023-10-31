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
        view.backgroundColor = .green
        configureModule()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.fetchCategories()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterMealsProtocol?
    
    func configureModule() {
        let presenterObject: ViewToPresenterMealsProtocol & InteractorToPresenterMealsProtocol = MealsPresenter()
        presenter = presenterObject
        presenter?.router = MealsRouter()
        presenter?.interactor = MealsInteractor()
        presenter?.view = self
        presenter?.interactor?.presenter = presenterObject
    }
    
}

extension MealsViewController: PresenterToViewMealsProtocol {
    func reloadCategoriesSection(with categories: [MealCategory]) {
        print(categories)
    }
    
    func presentError(_ error: TheMovieAPIError) {
        let alert = UIAlertController(title: "Error",
                                      message: error.rawValue,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
