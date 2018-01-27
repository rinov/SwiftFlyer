//
//  CoinHistory.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public struct CoinHistory: Codable {
    public let id: Int
    public let orderID: String
    public let currencyCode: CurrencyCode
    public let amount: Double
    public let address: String
    public let txHash: String
    public let status: CoinStatus
    public let eventDate: String

    public init(id: Int, orderID: String, currencyCode: CurrencyCode, amount: Double, address: String, txHash: String, status: CoinStatus, eventDate: String) {
        self.id = id
        self.orderID = orderID
        self.currencyCode = currencyCode
        self.amount = amount
        self.address = address
        self.txHash = txHash
        self.status = status
        self.eventDate = eventDate
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case orderID = "order_id"
        case currencyCode = "currency_code"
        case amount
        case address
        case txHash = "tx_hash"
        case status
        case eventDate = "event_date"
    }
}

extension CoinHistory: Equatable {
    public static func ==(lhs: CoinHistory, rhs: CoinHistory) -> Bool {
        return lhs.id == rhs.id
            && lhs.orderID == rhs.orderID
            && lhs.currencyCode == rhs.currencyCode
            && lhs.amount == rhs.amount
            && lhs.address == rhs.address
            && lhs.txHash == rhs.txHash
            && lhs.status == rhs.status
            && lhs.eventDate == rhs.eventDate
    }
}
