//
//  DashboardPresenter.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

class DashboardPresenter<T: DashboardView>: BasePresenter<T> {
    
    var transactions: [TransactionCategory] = []
    
    override init(view: T, dataInstance: ExpenseTrackerData = ExpenseTrackerDataRepo.sharedInstance) {
        super.init(view: view, dataInstance: dataInstance)
    }
    
    // MARK: FUNCTIONS
    func getTransactionCategorySectionCount() -> Int {
        return transactions.count
    }
    
    func getTransactionsCount(section: Int) -> Int {
        return transactions[section].transactions.count
    }
    
    func getTransactionListViewModel(index: Int) -> TransactionListViewModel {
        let transaction = transactions[index]
        return TransactionListViewModel(from: transaction)
    }
    
    func removeTransaction(indexPath: IndexPath) {
        let accountType = AccoutType(rawValue: getTransactionListViewModel(index: indexPath.section).name ?? "")
        switch accountType {
        case .CASH:
            dataInstance.removeTransactionCash(row: indexPath.row)
        case .CREDIT_CARD:
            dataInstance.removeTransactionCrediatCard(row: indexPath.row)
        case .BANK_ACCOUNT:
            dataInstance.removeTransactionBankAccount(row: indexPath.row)
        case .none: break
        }
    }
    
    // MARK: DATA CALLS
    func loadTransaction() {
        dataInstance.getTransactions {[unowned self] (transactions, error) in
            if let error = error {
                DispatchQueue.main.async {
                    self.interpretError(title: "Loading Error", error: error)
                }
            } else {
                guard let transactions = transactions else {
                    DispatchQueue.main.async {
                        view?.showAlert(title: "No Transactions Available", message: nil, actions: nil)
                    }
                    return
                }
                self.transactions = transactions
                view?.reloadTable()
            }
        }
    }
}
