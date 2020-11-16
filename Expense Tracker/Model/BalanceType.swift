//
//  BalanceType.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

enum BalanceType: String, CaseIterable, CustomStringConvertible {
    case EXPENSE = "Expense"
    case INCOME = "Income"
    
    public var description: String {
        switch self {
        case .EXPENSE:
            return "Expense"
        case .INCOME:
            return "Income"
        }
    }
    
    public var category: [String] {
        switch self {
        case .EXPENSE:
            return [Category.TAX.description,
                    Category.GROCERY.description,
                    Category.ENTERTAIMENT.description,
                    Category.GYM.description,
                    Category.HEALT.description]
        case .INCOME:
            return [Category.SALARY.description,
                    Category.DIVIDENDS.description]
        }
    }
}
