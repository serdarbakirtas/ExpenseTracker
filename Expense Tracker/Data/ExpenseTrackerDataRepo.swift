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
    
    func execute(completion: @escaping ([TransactionCategory]?, Error?) -> Void) {
        var transactionCategoryList = [TransactionCategory]()
        
        let transactioCash = TransactionCategory(name: "Cash", transactions: transactionCash)
        let transactioCreditCard = TransactionCategory(name: "Credit Card", transactions: transactionCrediatCard)
        let transactioBankAccount = TransactionCategory(name: "Bank Account", transactions: transactionBankAccount)
        
        transactionCategoryList.append(transactioCash)
        transactionCategoryList.append(transactioCreditCard)
        transactionCategoryList.append(transactioBankAccount)
        
        completion(transactionCategoryList, nil)
    }
}
