//
//  DashboardHeaderView.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

class DashboardHeaderView: UITableViewHeaderFooterView {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(amountLabel)
        addSubview(seperatorView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        NSLayoutConstraint.activate([
            seperatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            seperatorView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            seperatorView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            seperatorView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    // MARK: FUNCTIONS
    func populate(transaction: TransactionListViewModel) {
        nameLabel.text = transaction.name
        amountLabel.text = " \(transaction.amount ?? 0)".toCurrency
    }
}

extension String {
    
    var toCurrency: String {
        return self.replacingOccurrences(of: " ", with: "€").replacingOccurrences(of: ".0", with: "")
    }
}
