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
            return [AccoutType.CASH.rawValue,
                    AccoutType.CREDIT_CARD.rawValue,
                    AccoutType.BANK_ACCOUNT.rawValue]
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

enum AccoutType: String {
    case CASH = "Cash"
    case CREDIT_CARD = "Credit Card"
    case BANK_ACCOUNT = "Bank Account"
}
