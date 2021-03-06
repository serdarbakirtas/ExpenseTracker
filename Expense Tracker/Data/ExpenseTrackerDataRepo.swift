//
//  ExpenseTrackerDataRepo.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import Foundation

class ExpenseTrackerDataRepo: ExpenseTrackerData {
    
    var transactionCash = [Transaction]()
    var transactionCrediatCard = [Transaction]()
    var transactionBankAccount = [Transaction]()
    
    // SINGLETON
    static let sharedInstance = ExpenseTrackerDataRepo()
    
    init() {}
    
    // MARK: GET
    func getTransactions(completion: @escaping ([TransactionCategory]?, Error?) -> Void) {
        var transactionCategoryList = [TransactionCategory]()
        
        let transactioCash = TransactionCategory(name: "Cash", transactions: transactionCash)
        let transactioCreditCard = TransactionCategory(name: "Credit Card", transactions: transactionCrediatCard)
        let transactioBankAccount = TransactionCategory(name: "Bank Account", transactions: transactionBankAccount)
        
        transactionCategoryList.append(transactioCash)
        transactionCategoryList.append(transactioCreditCard)
        transactionCategoryList.append(transactioBankAccount)
        
        completion(transactionCategoryList, nil)
        
        // TODO: Check error view
//        completion(nil, CustomError(title: "", description: "", code: 404))
    }
    
    // MARK: POST
    func addTransactionCash(transaction: Transaction) {
        transactionCash.append(transaction)
    }
    
    func addTransactionCrediatCard(transaction: Transaction) {
        transactionCrediatCard.append(transaction)
    }
    
    func addTransactionBankAccount(transaction: Transaction) {
        transactionBankAccount.append(transaction)
    }
    
    // MARK: DELETE
    func removeTransactionCash(row: Int) {
        transactionCash.remove(at: row)
    }
    
    func removeTransactionCrediatCard(row: Int) {
        transactionCrediatCard.remove(at: row)
    }
    
    func removeTransactionBankAccount(row: Int) {
        transactionBankAccount.remove(at: row)
    }
}
