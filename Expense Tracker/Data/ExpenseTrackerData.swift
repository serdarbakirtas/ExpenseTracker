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
    func addTransactionCashe(transaction: Transaction)
    func addTransactionCrediatCard(transaction: Transaction)
    func addTransactionBankAccount(transaction: Transaction)
}
