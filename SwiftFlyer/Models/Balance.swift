//
//  Balance.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct Balance: Codable {
    public let amount: Double
    public let available: Double
    public let currencyCode: CurrencyCode

    public init(amount: Double, available: Double, currencyCode: CurrencyCode) {
        self.amount = amount
        self.available = available
        self.currencyCode = currencyCode
    }
    
    public enum CodingKeys: String, CodingKey {
        case amount
        case available
        case currencyCode = "currency_code"
    }
}

extension Balance: Equatable {
    public static func ==(lhs: Balance, rhs: Balance) -> Bool {
        return lhs.amount == rhs.amount
            && lhs.available == rhs.available
            && lhs.currencyCode == rhs.currencyCode
    }
}
