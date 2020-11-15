//
//  DashboardPresenterUnitTest.swift
//  Expense TrackerTests
//
//  Created by Hasan on 04.11.20.
//

@testable import Expense_Tracker
import XCTest

class DashboardPresenterUnitTest: XCTestCase {

    var presenter: DashboardPresenter<DashboardViewMock>!
    let viewMock = DashboardViewMock()
    let dataMock = ExpenseTrackerDataMock()
    
    override func setUp() {
        super.setUp()
        
        presenter = DashboardPresenter(view: viewMock, dataInstance: dataMock)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGettingDashboardListCount() {
        presenter.transactions.append(dataMock.getTransactions())
        
        XCTAssertEqual(presenter.getTransactionsCount(section: 0), 1)
    }
    
    func testGettingViewModel() {
        presenter.transactions = [dataMock.getTransactions()]
        presenter.loadTransaction()
        
        wait(for: [viewMock.reloadTableViewExp], timeout: 1)
        
        XCTAssertEqual(presenter.getTransactionListViewModel(index: 0).amount,
                       dataMock.getTransactionLisViewModel().amount)
    }
    
    func testRemovingTransaction() {
        presenter.transactions.append(dataMock.getTransactions())
        presenter.removeTransaction(indexPath: IndexPath(row: 0, section: 0))
        
        XCTAssert(dataMock.isTansactionRemoveCashCalled)
    }
}
