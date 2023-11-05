//
//  MealsInteractor.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import Foundation
import Moya

class MealsInteractor: PresenterToInteractorMealsProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterMealsProtocol?
    var categories: [MealCategory] = []
    
    func fetchCategories() {
        let provider = MoyaProvider<TheMealDBAPI>()
        provider.request(.fetchCategories) { [weak self] result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                do {
                    let categoriesResponse = try JSONDecoder().decode(CategoriesResponse.self, from: data)
                    self?.categories = categoriesResponse.categories
                    DispatchQueue.main.async {
                        self?.presenter?.didFetchCategories(categories: self?.categories ?? [])
                    }
                } catch {
                    DispatchQueue.main.async {
                        self?.presenter?.didFailFetchingCategories(with: TheMovieAPIError.decodingError)
                    }
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.presenter?.didFailFetchingCategories(with: .internalError)
                }
            }
        }
    }
    
    func fetchMeals(_ category: String) {
        let provider = MoyaProvider<TheMealDBAPI>()
        provider.request(.fetchMeals(category: category)) { [weak self] result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                do {
                    let mealsResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
                    
                    guard let currentCategory = self?.categories.first(where: { option in
                        category == option.optionValue
                    }) else {
                        return
                    }
                    
                    var meals = mealsResponse.meals.map { meal in
                        var mealWithCategory = meal
                        mealWithCategory.category = currentCategory
                        return mealWithCategory
                    }
                    
                    
                    DispatchQueue.main.async {
                        self?.presenter?.didFetchMeals(meals: meals)
                    }
                } catch {
                    DispatchQueue.main.async {
                        self?.presenter?.didFailFetchingCategories(with: TheMovieAPIError.decodingError)
                    }
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.presenter?.didFailFetchingCategories(with: .internalError)
                }
            }
        }
    }
}

