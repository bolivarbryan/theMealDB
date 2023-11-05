//
//  GridCollectionViewCell.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 3/11/23.
//

import UIKit
import SnapKit
import Kingfisher

protocol GridCollectionViewCellDelegate {
    func didPressAddToCart(with meal: Meal)
}

class GridCollectionViewCell: UICollectionViewCell {
    static let idenfifier = "UICollectionViewCellIdentifier"
    private let cellImageView = UIImageView()
    private let mealPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        return label
    }()
    private let actionButton: UIButton = {
        let button = TMButton(title: "Add to cart", style: .bubble)
        button.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        return button
    }()
    
    var meal: Meal? = nil {
        didSet {
            guard let meal = meal else { return }
            cellImageView.kf.setImage(with: URL(string: meal.thumbnail))
            mealPriceLabel.text = "$\(meal.price)"
        }
    }
    
    var delegate: GridCollectionViewCellDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    func configureUI(){
        
        addSubview(cellImageView)

        cellImageView.backgroundColor = UIColor(hue: CGFloat(drand48()),
                                            saturation: 1,
                                            brightness: 1,
                                            alpha: 1)
        cellImageView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        
        addSubview(mealPriceLabel)
        mealPriceLabel.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview().inset(10)
        }
        
        addSubview(actionButton)
        actionButton.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(10)
        }
        actionButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addAction() {
        guard let meal = meal else { return }
        delegate?.didPressAddToCart(with: meal)
    }
}
