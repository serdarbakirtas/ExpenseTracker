//
//  BaseViewPresenter.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

class BaseViewPresenter<T: BaseView>: BasePresenter<T> {
    
    override init(view: T, dataInstance: ExpenseTrackerData = ExpenseTrackerDataRepo.sharedInstance) {
        super.init(view: view, dataInstance: dataInstance)
    }
}
