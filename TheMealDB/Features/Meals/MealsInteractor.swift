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
                let statusCode = moyaResponse.statusCode
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
}
