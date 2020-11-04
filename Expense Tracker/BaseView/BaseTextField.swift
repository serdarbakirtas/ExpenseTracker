//
//  BaseTextField.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

class BaseTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS
    private func configureTextField() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .black
        textAlignment = .center
        borderStyle = .roundedRect
        font = UIFont.systemFont(ofSize: 14)
        adjustsFontSizeToFitWidth = true
    }
    
    func populate(placeholder: String) {
        self.placeholder = placeholder
    }
    
    func populate(text: String) {
        self.text = text
    }
}
