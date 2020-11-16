//
//  TransactionType.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

enum TransactionType: CaseIterable {
    case TRANSACTION
    
    public var category: [String] {
        switch self {
        case .TRANSACTION:
            return [AccoutType.CASH.description,
                    AccoutType.CREDIT_CARD.description,
                    AccoutType.BANK_ACCOUNT.description]
        }
    }
}

extension AccoutType {
    
    static func getType(for stringValue: String) -> AccoutType {
        switch stringValue {
        case "Cash":
            return .CASH
        case "Credit Card":
            return .CREDIT_CARD
        case "Bank Account":
            return .BANK_ACCOUNT
        default:
            return .CASH
        }
    }
}

enum AccoutType: String, CustomStringConvertible {
    case CASH = "Cash"
    case CREDIT_CARD = "Credit Card"
    case BANK_ACCOUNT = "Bank Account"
    
    public var description: String {
        switch self {
        case .CASH:
            return "Cash"
        case .CREDIT_CARD:
            return "Credit Card"
        case .BANK_ACCOUNT:
            return "Bank Account"
        }
    }
}
