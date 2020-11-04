//
//  BalanceType.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

enum BalanceType: String, CaseIterable {
    case EXPENSE = "Expense"
    case INCOME = "Income"
    
    public var category: [String] {
        switch self {
        case .EXPENSE:
            return [Category.TAX.rawValue,
                    Category.GROCERY.rawValue,
                    Category.ENTERTAIMENT.rawValue,
                    Category.GYM.rawValue,
                    Category.HEALT.rawValue]
        case .INCOME:
            return [Category.SALARY.rawValue,
                    Category.DIVIDENDS.rawValue]
        }
    }
}
