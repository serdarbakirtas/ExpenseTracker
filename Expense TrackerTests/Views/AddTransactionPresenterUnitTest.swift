//
//  AddTransactionPresenterUnitTest.swift
//  Expense TrackerTests
//
//  Created by Hasan on 04.11.20.
//

@testable import Expense_Tracker
import XCTest

class AddTransactionPresenterUnitTest: XCTestCase {

    var presenter: AddTransactionPresenter<AddTransactionViewMock>!
    let viewMock = AddTransactionViewMock()
    let dataMock = ExpenseTrackerDataMock()
    
    override func setUp() {
        super.setUp()
        
        presenter = AddTransactionPresenter(view: viewMock, dataInstance: dataMock)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddingTransactionAddsAmount() {
        presenter.addTransaction(amount: "", category: "", account: "", balanceType: .INCOME)
        
        XCTAssertEqual(dataMock.getTransactions().transactions.first?.amount, 20.0)
        XCTAssertEqual(dataMock.getTransactions().transactions.first?.category, .TAX)
        XCTAssertEqual(dataMock.getTransactions().transactions.count, 1)
    }
    
    func testAddingTrasnictionAmount() {
        XCTAssertEqual(presenter.getAmount(amount: "", balanceType: .INCOME), 0.0)
    }
    
    func testAddingCashAddsMockTransaction() {
        dataMock.addTransactionCash(transaction: Transaction(amount: 20.0, category:  Category(rawValue: "Taxes")))
        
        XCTAssert(dataMock.isTansactionCashCalled)
    }
    
    func testAddingCashAddsTransaction()  {
        presenter.addTransaction(amount: "250", category: "Taxes", account: "Cash", balanceType: .EXPENSE)
        
        XCTAssert(dataMock.isTansactionCashCalled)
    }
    
    func testAddingCreditCardAddsTransaction()  {
        presenter.addTransaction(amount: "250", category: "Taxes", account: "Credit Card", balanceType: .INCOME)
        
        XCTAssert(dataMock.isTransactionCreditCardCalled)
    }
    
    func testAddingBankAccountAddsTransaction()  {
        presenter.addTransaction(amount: "250", category: "Taxes", account: "Bank Account", balanceType: .EXPENSE)
        
        XCTAssert(dataMock.isTransactionBankAccountCalled)
    }
    
    func testAddingTransactionAddsCrediatCard() {
        dataMock.addTransactionCrediatCard(transaction: Transaction(amount: 20.0, category:  Category(rawValue: "Taxes")))
        
        XCTAssert(dataMock.isTransactionCreditCardCalled)
    }
    
    func testAddingTransactionAddsBankAccount() {
        dataMock.addTransactionBankAccount(transaction: Transaction(amount: 20.0, category:  Category(rawValue: "Taxes")))
        
        XCTAssert(dataMock.isTransactionBankAccountCalled)
    }
}
