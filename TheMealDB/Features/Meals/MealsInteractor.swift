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
    
    func fetchCategories() {
        let provider = MoyaProvider<TheMealDBAPI>()
        provider.request(.fetchCategories) { [weak self] result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                do {
                    let categoriesResponse = try JSONDecoder().decode(CategoriesResponse.self, from: data)
                    DispatchQueue.main.async {
                        self?.presenter?.didFetchCategories(categories: categoriesResponse.categories)
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
                    DispatchQueue.main.async {
                        self?.presenter?.didFetchMeals(meals: mealsResponse.meals)
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

