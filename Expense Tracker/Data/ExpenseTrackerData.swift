//
//  ExpenseTrackerData.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

protocol ExpenseTrackerData {
    // MARK: GET
    func execute(completion: @escaping ([TransactionCategory]?, Error?) -> Void)
}
