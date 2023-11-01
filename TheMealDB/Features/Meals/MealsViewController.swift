//
//  MealsViewController.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import UIKit
import SnapKit
import SwiftUI

class MealsViewController: UIViewController {
    // MARK: - Properties
    var presenter: ViewToPresenterMealsProtocol?
    private var header = PickerView()

    @IBOutlet weak var verticalStackView: UIStackView!
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModule()
        title = "TMDB"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addCategoriesPicker()
    }
    
    func addCategoriesPicker() {
        verticalStackView.addArrangedSubview(header)
        verticalStackView.addArrangedSubview(UIView())
        header.delegate = self
        presenter?.fetchCategories()
    }

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
        header.setOptions(categories)
        view.layoutIfNeeded()
        view.layoutSubviews()
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


extension MealsViewController: PickerViewDelegate {
    func didPressHeader() {
        presenter?.fetchCategories()
    }
    
    func didSelectOption(_ option: String) {
        //Reload Meals Data
    }
}
