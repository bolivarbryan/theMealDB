//
//  CartViewController.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 6/11/23.
//  
//

import UIKit
import SwiftUI

class CartViewController: UIViewController {
    // MARK: - Properties
    var presenter: ViewToPresenterCartProtocol?
    var cartView = UIView(frame: .zero)
    var datasource = CartItemDataSource()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModule()
        title = "Cart"
        
        var itemsView = CartItemView(datasource: datasource)
        itemsView.delegate = self
        cartView = UIHostingController(rootView: itemsView).view!
        
        view.addSubview(cartView)
        cartView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getMealsFromCart()
    }
    
    func configureModule() {
        let presenterObject: ViewToPresenterCartProtocol & InteractorToPresenterCartProtocol = CartPresenter()
        presenter = presenterObject
        presenter?.router = CartRouter()
        presenter?.interactor = CartInteractor()
        presenter?.view = self
        presenter?.interactor?.presenter = presenterObject
    }
    
    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemYellow
        appearance.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

extension CartViewController: PresenterToViewCartProtocol{
    
    func didGetMealsFromCart(meals: [MealItem]) {
        datasource.cartItems = meals
    }
    
    func didUpdateQuantity() {
        presenter?.getMealsFromCart()
    }
    
    func didCompleteCheckout() {
        self.tabBarController?.selectedIndex = 0
    }
}

extension CartViewController: CartItemViewDelegate {
    func increaseQuantity(for meal: MealItem) {
        presenter?.increaseQuantityForMeal(meal)
    }
    
    func decreaseQuantity(for meal: MealItem) {
        presenter?.decreaseQuantityForMeal(meal)
    }
    
    func didSelectCheckout() {
        let alert = UIAlertController(title: "Checkout Ready",
                                      message: "You are about to complete this purchase, once confirmed your cart will be cleared.",
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.presenter?.completeCheckout()
        }
        
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
