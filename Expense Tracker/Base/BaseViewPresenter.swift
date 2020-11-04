//
//  BaseViewPresenter.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import Foundation

class BaseViewPresenter<T: BaseView>: BasePresenter<T> {
    
    override init(view: T) {
        super.init(view: view)
    }
}
