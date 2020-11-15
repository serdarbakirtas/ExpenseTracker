//
//  ExpenseTrackerAPIMock.swift
//  Expense TrackerTests
//
//  Created by Hasan on 04.11.20.
//

import Foundation
@testable import Expense_Tracker
import XCTest

class ExpenseTrackerDataMock: ExpenseTrackerData {
    
    var isTansactionCashCalled = false
    var isTransactionCreditCardCalled = false
    var isTransactionBankAccountCalled = false
    var isTansactionRemoveCashCalled = false
    var isTransactionRemoveCreditCardCalled = false
    var isTransactionRemoveBankAccountCalled = false
    
    init() {}
    
    func getTransactions(completion: @escaping ([TransactionCategory]?, Error?) -> Void) {
        completion([createTransactionObject()], nil)
    }
    
    func addTransactionCash(transaction: Transaction) {
        isTansactionCashCalled = true
    }
    
    func addTransactionCrediatCard(transaction: Transaction) {
        isTransactionCreditCardCalled = true
    }
    
    func addTransactionBankAccount(transaction: Transaction) {
        isTransactionBankAccountCalled = true
    }
    
    func createTransactionObject() -> TransactionCategory {
        return TransactionCategory(name: "Cash",
                                   transactions: [Transaction(amount: 20.0,
                                                              category: Category(rawValue: "Taxes"))])
    }
    
    func getTransactions() -> TransactionCategory {
        let transaction = createTransactionObject()
        return transaction
    }
    
    func getTransactionLisViewModel() -> TransactionListViewModel {
        return TransactionListViewModel(from: createTransactionObject())
    }
    
    func removeTransactionCash(row: Int) {
        isTansactionRemoveCashCalled = true
    }
    
    func removeTransactionCrediatCard(row: Int) {
        isTransactionRemoveCreditCardCalled = true
    }
    
    func removeTransactionBankAccount(row: Int) {
        isTransactionRemoveBankAccountCalled = true
    }
}
