//
//  DashboardViewController.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

protocol DashboardView: BaseView {
    func reloadTable()
}

class DashboardViewController: BaseViewController {
    
    // MARK: UI
    var transactionTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(TransactionCell.self, forCellReuseIdentifier: "transactionCell")
        return tableView
    }()
    
    // MARK: PROPERTIES
    var presenter: DashboardPresenter<DashboardViewController>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Dashboard"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onTapAddTransaction))
        navigationItem.setRightBarButton(addButton, animated: false)
        
        addSubviews()
        transactionTableView.dataSource = self
        transactionTableView.delegate = self
        
        presenter = DashboardPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.loadTransaction()
        reloadTable()
    }
    
    // MARK: FUNCTIONS
    private func addSubviews() {
        view.addSubview(transactionTableView)
        
        NSLayoutConstraint.activate([
            transactionTableView.topAnchor.constraint(equalTo: view.topAnchor),
            transactionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            transactionTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            transactionTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    // MARK: ACTIONS
    @objc private func onTapAddTransaction() {
        let addTransactionVC = AddTransactionViewControlller()
        presentVC(viewController: addTransactionVC)
    }
}

extension DashboardViewController: DashboardView {
    
    func reloadTable() {
        transactionTableView.reloadData()
    }
}

extension DashboardViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.getTransactionCategorySectionCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getTransactionsCount(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionCell
        let transactionViewModel = presenter.getTransactionListViewModel(index: indexPath.section)
        if let transaction = transactionViewModel.transactions?[indexPath.row] {
            cell.populate(transaction: transaction)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = DashboardHeaderView(frame: tableView.frame)
        let transactionViewModel = presenter.getTransactionListViewModel(index: section)
        headerView.populate(transaction: transactionViewModel)
        return headerView
    }
}

extension DashboardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let accountType = AccoutType(rawValue: presenter.getTransactionListViewModel(index: indexPath.section).name ?? "")
            switch accountType {
            case .CASH:
                ExpenseTrackerDataRepo.sharedInstance.transactionCash.remove(at: indexPath.row)
            case .CREDIT_CARD:
                ExpenseTrackerDataRepo.sharedInstance.transactionCrediatCard.remove(at: indexPath.row)
            case .BANK_ACCOUNT:
                ExpenseTrackerDataRepo.sharedInstance.transactionBankAccount.remove(at: indexPath.row)
            case .none: break
            }
            
            presenter.loadTransaction()
            reloadTable()
        }
    }
}
