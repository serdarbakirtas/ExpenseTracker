//
//  DashboardPresenter.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

class DashboardPresenter<T: OffersView>: BasePresenter<T> {
    
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
    
    // MARK: REPO CALLS
    func loadTransaction() {
        dataInstance.execute {[unowned self] (transactions, error) in
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
