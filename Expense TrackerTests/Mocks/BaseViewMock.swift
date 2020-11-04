//
//  BaseViewMock.swift
//  Expense TrackerTests
//
//  Created by Hasan on 04.11.20.
//

@testable import Expense_Tracker
import XCTest

class BaseViewMock: NSObject, BaseView {
    
    var isHideIndicatorCalled = false
    var isShowAlertCalled = false
    
    var showAlertExp = XCTestCase().expectation(description: "Show Alert")
    var showTimelineExp = XCTestCase().expectation(description: "Show Timeline")
    var hideActivityIndicatorExp = XCTestCase().expectation(description: "Hide Indicator")

    func showAlert(title: String?, message: String?, actions: [UIAlertAction]?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions ?? [] {
            alert.addAction(action)
        }
        
        if #available(iOS 13, *) {
            UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController?.present(
                alert, animated: false, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController?.present(
                alert, animated: false, completion: nil)
        }
        
        isShowAlertCalled = true
        showAlertExp.fulfill()
    }
    
    func showFullScreenActivityIndicator(isShown: Bool) {
        if !isShown, !isHideIndicatorCalled {
            isHideIndicatorCalled = true
            hideActivityIndicatorExp.fulfill()
        }
    }
    
    func isAlreadyInCase(caseId: Int) -> Bool {
        return false
    }
}
