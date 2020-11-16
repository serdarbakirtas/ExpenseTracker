//
//  AddTransactionLayoutView.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

class AddTransactionLayoutView: UIView {
    
    @objc enum DateType: Int {
        case ACCOUNT
        case CATEGORY
    }
    
    // MARK: PROPERTIES
    private let accounts = TransactionType.TRANSACTION.category
    private let accountPickerView = BasePickerView()
    private let categoryPickerView = BasePickerView()
    private var selectedDateType: DateType = .ACCOUNT
    var balanceType: BalanceType = .INCOME
    var items: [String]?
    
    // MARK: UI
    var transactionSegmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: [BalanceType.INCOME.description, BalanceType.EXPENSE.description])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.backgroundColor = .white
        return segmentControl
    }()
    
    let accountTextField: BaseTextField = {
        let textField = BaseTextField()
        textField.populate(placeholder: "Select account")
        return textField
    }()
    
    let categoryTextField: BaseTextField = {
        let textField = BaseTextField()
        textField.populate(placeholder: "Select category")
        return textField
    }()
    
    let amountTextField: BaseTextField = {
        let textField = BaseTextField()
        textField.keyboardType = .asciiCapableNumberPad
        textField.populate(placeholder: "Enter amount")
        return textField
    }()
    
    let transactionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var toolbarPicker: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        toolbar.translatesAutoresizingMaskIntoConstraints = true
        let doneButton = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(onSelectPicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onCancelPicker))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolbar.sizeToFit()
        return toolbar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViews()
        
        accountPickerView.configurePickerView(items: accounts)
        categoryPickerView.configurePickerView(items: BalanceType.INCOME.category)
        
        configureInputData()
        configureDelegate()
        addSegmentControls()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            transactionSegmentControl.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            transactionSegmentControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            transactionSegmentControl.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        NSLayoutConstraint.activate([
            transactionStackView.topAnchor.constraint(equalTo: transactionSegmentControl.bottomAnchor, constant: 16),
            transactionStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            transactionStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            transactionStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        ])
    }
    
    // MARK: FUNCTIONS
    private func configureDelegate() {
        accountTextField.delegate = self
        categoryTextField.delegate = self
        amountTextField.delegate = self
        categoryPickerView.pickerViewDelegate = self
        accountPickerView.pickerViewDelegate = self
    }
    
    private func configureInputData() {
        accountTextField.inputView = accountPickerView
        categoryTextField.inputView = categoryPickerView
        accountTextField.inputAccessoryView = toolbarPicker
        categoryTextField.inputAccessoryView = toolbarPicker
    }
    
    private func addSubViews() {
        addSubview(transactionSegmentControl)
        addSubview(transactionStackView)
        
        transactionStackView.addArrangedSubview(accountTextField)
        transactionStackView.addArrangedSubview(categoryTextField)
        transactionStackView.addArrangedSubview(amountTextField)
    }
    
    private func addSegmentControls() {
        transactionSegmentControl.selectedSegmentIndex = 0
        transactionSegmentControl.addTarget(self, action: #selector(changeSegmentType(segment:)), for: .valueChanged)
    }
    
    // MARK: ACTIONS
    @objc private func changeSegmentType(segment: UISegmentedControl) {
        onCancelPicker()
        accountTextField.populate(text: "")
        categoryTextField.populate(text: "")
        if transactionSegmentControl.selectedSegmentIndex == 0 {
            balanceType = .INCOME
            categoryPickerView.items = BalanceType.INCOME.category
        } else {
            balanceType = .EXPENSE
            categoryPickerView.items = BalanceType.EXPENSE.category
        }
    }
    
    @objc func onCancelPicker() {
        switch selectedDateType {
        case .ACCOUNT:
            accountTextField.resignFirstResponder()
        case .CATEGORY:
            categoryTextField.resignFirstResponder()
        }
    }
    
    @objc func onSelectPicker() {
        switch selectedDateType {
        case .ACCOUNT:
            accountTextField.resignFirstResponder()
        case .CATEGORY:
            categoryTextField.resignFirstResponder()
        }
    }
}

extension AddTransactionLayoutView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == accountTextField {
            selectedDateType = .ACCOUNT
            accountTextField.populate(text: accounts.first ?? "")
        } else if textField == categoryTextField {
            selectedDateType = .CATEGORY
            switch balanceType {
            case .EXPENSE:
                categoryTextField.populate(text: BalanceType.EXPENSE.category.first ?? "")
            case .INCOME:
                categoryTextField.populate(text: BalanceType.INCOME.category.first ?? "")
            }
        }
    }
}

extension AddTransactionLayoutView: BasePickerViewDelegate {
    
    func didSelectRowInPickerView(_ pickerView: UIPickerView, didSelectRow row: Int) {
        if pickerView == accountPickerView {
            accountTextField.populate(text: accounts[row])
        } else {
            switch balanceType {
            case .EXPENSE:
                categoryTextField.populate(text: BalanceType.EXPENSE.category[row])
            case .INCOME:
                categoryTextField.populate(text: BalanceType.INCOME.category[row])
            }
        }
    }
}
