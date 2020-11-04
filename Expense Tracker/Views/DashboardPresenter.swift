//
//  DashboardPresenter.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

class DashboardPresenter<T: OffersView>: BasePresenter<T> {
    
    override init(view: T, dataInstance: ExpenseTrackerData = ExpenseTrackerDataRepo.sharedInstance) {
        super.init(view: view, dataInstance: dataInstance)
    }
}
