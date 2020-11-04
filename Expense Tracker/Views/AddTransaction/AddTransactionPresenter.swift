//
//  AddTransactionPresenter.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import Foundation
import UIKit

class AddTransactionPresenter<T: AddTransactionView>: BasePresenter<T> {
    
    override init(view: T, dataInstance: ExpenseTrackerData = ExpenseTrackerDataRepo.sharedInstance) {
        super.init(view: view, dataInstance: dataInstance)
    }
    
    // MARK: FUNCTIONS
    func addTransaction(amount: String, category: String, account: String, balanceType: BalanceType) {
        if !(amount.isEmpty) && !(category.isEmpty) && !(account.isEmpty) {
            let category = Category(rawValue: category)
            let transaction = Transaction(amount: getAmount(amount: amount, balanceType: balanceType),
                                          category: category!)
            let accountType = AccoutType.getType(for: account)
            
            switch accountType {
            case .CASH:
                dataInstance.addTransactionCash(transaction: transaction)
            case .CREDIT_CARD:
                dataInstance.addTransactionCrediatCard(transaction: transaction)
            case .BANK_ACCOUNT:
                dataInstance.addTransactionBankAccount(transaction: transaction)
            }
        }
    }
    
    func getAmount(amount: String, balanceType: BalanceType) -> Double {
        var amount = Double(amount) ?? 0.0
        if balanceType == .EXPENSE {
            amount = -amount
        }
        return amount
    }
}
