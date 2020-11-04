//
//  TransactionListViewModel.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import Foundation
import UIKit

struct TransactionListViewModel {
    
    var name: String?
    var amount: Double?
    var transactions: [Transaction]?
    
    init(from items: TransactionCategory) {
        name = getTransactionName(items: items)
        amount = getTransactionAmmount(items: items)
        transactions = getTransactions(items: items)
    }
        
    func getTransactionName(items: TransactionCategory) -> String {
        return items.name
    }
    
    func getTransactionAmmount(items: TransactionCategory) -> Double {
        return items.transactions.map({ $0.amount }).reduce(0, +)
    }
    
    func getTransactions(items: TransactionCategory) -> [Transaction] {
        return items.transactions
    }
}
