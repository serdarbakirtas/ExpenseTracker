//
//  DashboardViewController.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

protocol OffersView: BaseView {}

class DashboardViewController: BaseViewController {
    
    // MARK: PROPERTIES
    var presenter: DashboardPresenter<DashboardViewController>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Dashboard"
        
        presenter = DashboardPresenter(view: self)
    }
}

extension DashboardViewController: OffersView {
    
    func reloadTable() {}
}
