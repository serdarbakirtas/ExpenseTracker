//
//  ExpenseTrackerData.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

protocol ExpenseTrackerData {
    // MARK: GET
    func getTransactions(completion: @escaping ([TransactionCategory]?, Error?) -> Void)
    
    // MARK: POST
    func addTransactionCash(transaction: Transaction)
    func addTransactionCrediatCard(transaction: Transaction)
    func addTransactionBankAccount(transaction: Transaction)
    
    // MARK: DELETE
    func removeTransactionCash(row: Int)
    func removeTransactionCrediatCard(row: Int)
    func removeTransactionBankAccount(row: Int)
}
