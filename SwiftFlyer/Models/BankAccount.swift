//
//  BankAccount.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public struct BankAccount: Codable {
    public let id: Int
    public let isVerified: Bool
    public let bankName: String
    public let branchName: String
    public let accountType: String
    public let accountNumber: String
    public let accountName: String

    public init(id: Int, isVerified: Bool, bankName: String, branchName: String, accountType: String, accountNumber: String, accountName: String) {
        self.id = id
        self.isVerified = isVerified
        self.bankName = bankName
        self.branchName = branchName
        self.accountType = accountType
        self.accountNumber = accountNumber
        self.accountName = accountName
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case isVerified = "is_verified"
        case bankName = "bank_name"
        case branchName = "branch_name"
        case accountType = "account_type"
        case accountNumber = "account_number"
        case accountName = "account_name"
    }
}

extension BankAccount: Equatable {
    public static func ==(lhs: BankAccount, rhs: BankAccount) -> Bool {
        return lhs.id == rhs.id
            && lhs.isVerified == rhs.isVerified
            && lhs.bankName == rhs.bankName
            && lhs.branchName == rhs.branchName
            && lhs.accountType == rhs.accountType
            && lhs.accountNumber == rhs.accountNumber
            && lhs.accountName == rhs.accountName
    }
}
