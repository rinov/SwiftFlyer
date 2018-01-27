//
//  WithdrawHistory.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public struct WithdrawHistory: Codable {
    public let id: Int
    public let orderID: String
    public let currencyCode: CurrencyCode
    public let amount: Double
    public let status: CoinStatus
    public let eventDate: String

    public init(id: Int, orderID: String, currencyCode: CurrencyCode, amount: Double, status: CoinStatus, eventDate: String) {
        self.id = id
        self.orderID = orderID
        self.currencyCode = currencyCode
        self.amount = amount
        self.status = status
        self.eventDate = eventDate
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case orderID = "order_id"
        case currencyCode = "currency_code"
        case amount
        case status
        case eventDate = "event_date"
    }
}

extension WithdrawHistory: Equatable {
    public static func ==(lhs: WithdrawHistory, rhs: WithdrawHistory) -> Bool {
        return lhs.id == rhs.id
            && lhs.orderID == rhs.orderID
            && lhs.currencyCode == rhs.currencyCode
            && lhs.amount == rhs.amount
            && lhs.status == rhs.status
            && lhs.eventDate == rhs.eventDate
    }
}
