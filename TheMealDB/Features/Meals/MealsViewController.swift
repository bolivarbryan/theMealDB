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
    private var meals: [Meal] = []
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let cellWidth = (UIScreen.main.bounds.width/2) - 4
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 0, right: 3)
        layout.minimumInteritemSpacing = 2;
        layout.minimumLineSpacing = 2;
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.scrollDirection = .vertical
        return layout
    }()
    var gridCollectionView: UICollectionView!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModule()
        title = "TMDB"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addCategoriesPicker()
        addCollectionView()
    }
    
    func addCategoriesPicker() {
        verticalStackView.addArrangedSubview(header)
        verticalStackView.addArrangedSubview(UIView())
        header.delegate = self
        presenter?.fetchCategories()
    }
    
    func addCollectionView() {

        let cellFrame = CGRect(x: 0,
                               y: 0,
                               width: collectionViewLayout.itemSize.width,
                               height: collectionViewLayout.itemSize.height)


        gridCollectionView = UICollectionView(frame: cellFrame,
                                              collectionViewLayout: collectionViewLayout)

        gridCollectionView.backgroundColor = .white
        gridCollectionView.register(GridCollectionViewCell.self,
                                    forCellWithReuseIdentifier: GridCollectionViewCell.idenfifier)
        gridCollectionView.showsHorizontalScrollIndicator = false
        view.addSubview(gridCollectionView)

        gridCollectionView.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        gridCollectionView.dataSource = self
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
    
    func reloadMeals(with meals: [Meal]) {
        self.meals = meals
        gridCollectionView.reloadData()
    }
}

extension MealsViewController: PickerViewDelegate {
    func didPressHeader() {
        presenter?.fetchCategories()
    }
    
    func didSelectOption(_ option: Optionable) {
        presenter?.selectCategory(option.optionValue)
    }
}

extension MealsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCollectionViewCell.idenfifier, for: indexPath) as? GridCollectionViewCell else {
            return UICollectionViewCell(frame: .zero)
        }
        cell.meal = meals[indexPath.row]
        return cell
    }
}

extension MealsViewController: GridCollectionViewCellDelegate {
    func didPressAddToCart(with meal: Meal) {
        //TODO: Cart Feature
    }
}
