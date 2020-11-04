//
//  TransactionCell.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
      
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(amountLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let views = ["nameLabel": nameLabel, "amountLabel": amountLabel]
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[nameLabel]-|",
            options: [],
            metrics: nil,
            views: views))
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[amountLabel]-|",
            options: [],
            metrics: nil,
            views: views))
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(8)-[nameLabel]-(>=8)-[amountLabel]-(8)-|",
            options: [],
            metrics: nil,
            views: views))
    }
    
    // MARK: FUNCTIONS
    func populate(transaction: Transaction) {
        if transaction.amount < 0 {
            amountLabel.textColor = .red
        } else {
            amountLabel.textColor = .green
        }
        nameLabel.text = transaction.category?.rawValue
        amountLabel.text = " \(transaction.amount)".toCurrency
    }
}
