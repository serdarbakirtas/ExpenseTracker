//
//  TransactionCategory.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

struct TransactionCategory {
    let name: String
    var transactions: [Transaction]
}

struct Transaction {
    let amount: Double
    let category: Category?
}

enum Category: String, CustomStringConvertible {
    case TAX = "Taxes"
    case GROCERY = "Grocery"
    case ENTERTAIMENT = "Entertaiment"
    case GYM = "Gym"
    case HEALT = "Healt & Fitness"
    case SALARY = "Salary"
    case DIVIDENDS = "Dividends"
    
    public var description: String {
        switch self {
        case .TAX:
            return "Tax"
        case .GROCERY:
            return "Grocery"
        case .ENTERTAIMENT:
            return "Entertaiment"
        case .GYM:
            return "Gym"
        case .HEALT:
            return "Health"
        case .SALARY:
            return "Salary"
        case .DIVIDENDS:
            return "Dividends"
        }
    }
}
