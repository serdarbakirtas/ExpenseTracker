//
//  AddTransactionViewControlller.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

protocol AddTransactionView: BaseView {}

class AddTransactionViewControlller: BaseViewController {
    
    // MARK: UI
    var addTransactionLayoutView: AddTransactionLayoutView = {
        let layoutView = AddTransactionLayoutView()
        layoutView.translatesAutoresizingMaskIntoConstraints = false
        layoutView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return layoutView
    }()
    
    // MARK: PROPERTIES
    var presenter: AddTransactionPresenter<AddTransactionViewControlller>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = AddTransactionPresenter(view: self)
        
        view.backgroundColor = UIColor.white
        addBarButtonItems()
        addSubviews()
    }
    
    // MARK: FUNCTIONS
    private func addSubviews() {
        view.addSubview(addTransactionLayoutView)
        
        NSLayoutConstraint.activate([
            addTransactionLayoutView.leftAnchor.constraint(equalTo: view.leftAnchor),
            addTransactionLayoutView.rightAnchor.constraint(equalTo: view.rightAnchor),
            addTransactionLayoutView.topAnchor.constraint(equalTo: view.topAnchor),
            addTransactionLayoutView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1),
        ])
    }
    
    private func addBarButtonItems() {
        let closeButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onTapCancel))
        navigationItem.setLeftBarButton(closeButton, animated: false)
        
        let saveButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onTapDone))
        navigationItem.setRightBarButton(saveButton, animated: false)
    }
    
    // MARK: ACTIONS
    @objc private func onTapDone() {
        if let amountString = addTransactionLayoutView.amountTextField.text,
           let category = addTransactionLayoutView.categoryTextField.text,
           let account = addTransactionLayoutView.accountTextField.text {
            presenter?.addTransaction(amount: amountString, category: category, account: account,
                                      balanceType: addTransactionLayoutView.balanceType)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func onTapCancel() {
        dismiss(animated: true, completion: nil)
    }
}

extension AddTransactionViewControlller: AddTransactionView {}
