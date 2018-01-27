//
//  CollateralHistory.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct CollateralHistory: Codable {
    public let amount: Double
    public let change: Double
    public let currencyCode: String
    public let date: String
    public let id: Int
    public let reasonCode: String

    public init(amount: Double, change: Double, currencyCode: String, date: String, id: Int, reasonCode: String) {
        self.amount = amount
        self.change = change
        self.currencyCode = currencyCode
        self.date = date
        self.id = id
        self.reasonCode = reasonCode
    }
    
    public enum CodingKeys: String, CodingKey {
        case amount
        case change
        case currencyCode = "currency_code"
        case date
        case id
        case reasonCode = "reason_code"
    }
}

extension CollateralHistory: Equatable {
    public static func ==(lhs: CollateralHistory, rhs: CollateralHistory) -> Bool {
        return lhs.amount == rhs.amount
            && lhs.change == rhs.change
            && lhs.currencyCode == rhs.currencyCode
            && lhs.date == rhs.date
            && lhs.id == rhs.id
            && lhs.reasonCode == rhs.reasonCode
    }
}
