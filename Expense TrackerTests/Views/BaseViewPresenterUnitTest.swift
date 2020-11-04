//
//  BaseViewPresenterUnitTest.swift
//  Expense TrackerTests
//
//  Created by Hasan on 04.11.20.
//

import Foundation
@testable import Expense_Tracker
import XCTest

class BaseViewPresenterUnitTest: XCTestCase {
    
    var presenter: BaseViewPresenter<BaseViewMock>!
    let viewMock = BaseViewMock()
    let dataMock = ExpenseTrackerDataMock()
    
    override func setUp() {
        super.setUp()
        
        presenter = BaseViewPresenter(view: viewMock, dataInstance: dataMock)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
