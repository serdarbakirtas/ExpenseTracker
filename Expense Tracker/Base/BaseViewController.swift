//
//  BaseViewController.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

protocol BaseView: BasePresenterView {
    func showFullScreenActivityIndicator(isShown: Bool)
}

protocol PermissionListener where Self: UIViewController {
    func onPermissionsChanged()
}

class BaseViewController: UIViewController {
    
    private var presenter: BaseViewPresenter<BaseViewController>!
    
    lazy var activityIndicatorForTables: UIActivityIndicatorView = {
        UIActivityIndicatorView(style: .gray)
    }()
    
    lazy var fullScreenActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.backgroundColor = .gray
        activityIndicator.color = .green
        return activityIndicator
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        showFullScreenActivityIndicator(isShown: false)
    }
    
    func presentVC(viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.isTranslucent = false
        if let presentedVC = self.presentedViewController {
            presentedVC.dismiss(animated: true) {
                self.present(navigationController, animated: true)
            }
        } else {
            self.present(navigationController, animated: true)
        }
    }
    
    func pushVC(to navCont: UINavigationController, viewController: UIViewController) {
        if let presentedVC = navCont.presentedViewController {
            presentedVC.dismiss(animated: true) {
                navCont.pushViewController(viewController, animated: true)
            }
        } else {
            navCont.pushViewController(viewController, animated: true)
        }
    }
}

extension BaseViewController: BaseView {
    
    func showAlert(title: String?, message: String?, actions: [UIAlertAction]?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        if let actions = actions {
            for action in actions {
                alert.addAction(action)
            }
        } else {
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        }
        presentVC(viewController: alert)
    }
    
    func showFullScreenActivityIndicator(isShown: Bool) {
        if isShown {
            fullScreenActivityIndicator.startAnimating()
        } else {
            fullScreenActivityIndicator.stopAnimating()
        }
    }
}
