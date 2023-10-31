//
//  MealsInteractor.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 30/10/23.
//  
//

import Foundation

class MealsInteractor: PresenterToInteractorMealsProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterMealsProtocol?
    
    func fetchCategories() {
        presenter?.didFetchCategories(categories: [MealCategory(id: "1",
                                                                name: "Beef",
                                                                thumbnail: "",
                                                                description: "")]
        )
        
        presenter?.didFailFetchingCategories(with: XMLParsingError(line: 1, column: 1, kind: .internalError))
    }
}

struct XMLParsingError: Error {
    enum ErrorKind {
        case invalidCharacter
        case mismatchedTag
        case internalError
    }
    
    let line: Int
    let column: Int
    let kind: ErrorKind
}
