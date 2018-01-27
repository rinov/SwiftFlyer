//
//  CurrencyCode.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public enum CurrencyCode: String, Codable {
    case jpy = "JPY"
    case btc = "BTC"
    case eth = "ETH"
    case etc = "ETC"
    case bch = "BCH"
    case ltc = "LTC"
    case mona = "MONA"
    case unknown
    
    public init?(rawValue: String) {
        switch rawValue {
        case "JPY":
            self = .jpy
        case "BTC":
            self = .btc
        case "ETH":
            self = .eth
        case "ETC":
            self = .etc
        case "BCH":
            self = .bch
        case "LTC":
            self = .ltc
        case "MONA":
            self = .mona
        default:
            self = .unknown
        }
    }
}
