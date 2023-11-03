//
//  TMButton.swift
//  TheMealDB
//
//  Created by Bryan A Bolivar M on 1/11/23.
//

import UIKit

class TMButton: UIButton {
    
    enum ButtonStyle {
        case header
        case bubble
    }
    
    init(title: String, style: ButtonStyle) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        
        switch style {
        case .header:
            self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            self.setTitleColor(.systemBlue, for: .normal)
            backgroundColor = .clear
        case .bubble:
            self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            self.setTitleColor(.blue, for: .normal)
            backgroundColor = .yellow
            layer.cornerRadius = 10
            clipsToBounds = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

