//
//  PickerView.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 1/11/23.
//

import UIKit
import SnapKit
import SwiftUI

protocol PickerViewDelegate {
    func didPressHeader()
    func didSelectOption(_ option: Optionable)
}

class PickerView: UIView {

    private let stackView = UIStackView(frame: .zero)
    private var datasource = OptionsViewDataSource()
    private var optionsView = UIView(frame: .zero)
    var delegate: PickerViewDelegate?
    
    init() {
        super.init(frame: .zero)
        let button = makeHeaderButton()
        let listView = OptionsView(datasource: datasource,
                                   selectionAction: {
            self.delegate?.didSelectOption($0)
            button.setTitle($0.optionValue, for: .normal)
            self.toggleSelection(shouldHide: true)
        })
        optionsView = UIHostingController(rootView: listView).view!
        optionsView.clipsToBounds = true
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(optionsView)
        button.snp.makeConstraints { make in
            make.height.equalTo(60)
        }

        setupConstraints()
        optionsView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        optionsView.snp.makeConstraints { make in
            make.height.equalTo(180)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func displayOptions() {
        delegate?.didPressHeader()
        self.optionsView.isHidden.toggle()
    }
    
    func makeHeaderButton() -> TMButton {
        let button = TMButton(title: "Today I would like to have",
             style: .header)
        button.addTarget(self, action: #selector(displayOptions), for: .touchUpInside)
        button.backgroundColor = .yellow
        return button
    }
    
    func setOptions(_ options: [Optionable]) {
        datasource.options = options
    }
    
    func toggleSelection(shouldHide isHidden: Bool) {
        self.optionsView.isHidden = isHidden
    }
}
