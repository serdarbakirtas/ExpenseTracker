//
//  DashboardViewMock.swift
//  Expense TrackerTests
//
//  Created by Hasan on 04.11.20.
//

import Foundation
@testable import Expense_Tracker
import XCTest

class DashboardViewMock: BaseViewMock, DashboardView {

    var reloadTableViewExp = XCTestCase().expectation(description: "Reload Table View")
    
    var isRefreshTableCalled = false
    var isRowSelectedCalled = false
    
    func reloadTable() {
        reloadTableViewExp.fulfill()
        isRefreshTableCalled = true
    }
    
    func goToDashboardPage() {
        isRowSelectedCalled = true
    }
    
    func onRefresh() {}
}
