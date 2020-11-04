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
    let category: Category
}

enum Category: String {
    case TAX = "Taxes"
    case GROCERY = "Grocery"
    case ENTERTAIMENT = "Entertaiment"
    case GYM = "Gym"
    case HEALT = "Healt & Fitness"
    case SALARY = "Salary"
    case DIVIDENDS = "Dividends"
}
