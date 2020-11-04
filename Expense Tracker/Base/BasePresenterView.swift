//
//  BasePresenterView.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

protocol BasePresenterView: class {
    func showAlert(title: String?, message: String?, actions: [UIAlertAction]?)
}

class BasePresenter<T: BasePresenterView> {
    
    weak var view: T?
    var dataInstance: ExpenseTrackerData
    
    init(view: T, dataInstance: ExpenseTrackerData = ExpenseTrackerDataRepo.sharedInstance) {
        self.view = view
        self.dataInstance = dataInstance
    }
    
    func interpretError(title: String?, error: Error, actions: [UIAlertAction]? = nil) {
        var message: String?
        message = error.localizedDescription
        view?.showAlert(title: title, message: message, actions: actions)
    }
}
