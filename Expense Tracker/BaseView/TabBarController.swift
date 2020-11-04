//
//  TabBarController.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        tabBar.barTintColor = .white
        tabBar.isTranslucent = true
        tabBar.tintColor = .black

        let navigationController = UINavigationController()
        
        let chartVC = ChartViewController()
        let dashboardVC = DashboardViewController()
        
        navigationController.viewControllers.append(dashboardVC)
        
        dashboardVC.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(named: "icon_add"), tag: 0)
        chartVC.tabBarItem = UITabBarItem(title: "Chart", image: UIImage(named: "icon_dashboard"), tag: 1)
        self.viewControllers = [navigationController, chartVC]
    }
}
