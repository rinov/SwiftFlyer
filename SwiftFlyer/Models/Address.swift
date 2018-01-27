//
//  Address.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public struct Address: Codable {
    public let type: String
    public let currencyCode: CurrencyCode
    public let address: String
    
    public enum CodingKeys: String, CodingKey {
        case type
        case currencyCode = "currency_code"
        case address
    }
    
    public init(type: String, currencyCode: CurrencyCode, address: String) {
        self.type = type
        self.currencyCode = currencyCode
        self.address = address
    }
}

extension Address: Equatable {
    public static func ==(lhs: Address, rhs: Address) -> Bool {
        return lhs.type == rhs.type
            && lhs.currencyCode == rhs.currencyCode
            && lhs.address == rhs.address
    }
}
