//
//  ProductCode.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public enum ProductCode: String, Codable {
    case btc_jpy = "BTC_JPY"
    case eth_btc = "ETH_BTC"
    case bch_btc = "BCH_BTC"
    case fx_btc_jpy = "FX_BTC_JPY"
    case btc_jpy_12_jan_2018 = "BTCJPY12JAN2018"
    case btc_jpy_19_jan_2018 = "BTCJPY19JAN2018"
    case unknown
    
    public init?(rawValue: String) {
        switch rawValue {
        case ProductCode.btc_jpy.rawValue:
            self = .btc_jpy
        case ProductCode.eth_btc.rawValue:
            self = .eth_btc
        case ProductCode.bch_btc.rawValue:
            self = .bch_btc
        case ProductCode.fx_btc_jpy.rawValue:
            self = .fx_btc_jpy
        case ProductCode.btc_jpy_12_jan_2018.rawValue:
            self = .btc_jpy_12_jan_2018
        case ProductCode.btc_jpy_19_jan_2018.rawValue:
            self = .btc_jpy_19_jan_2018
        default:
            self = .unknown
        }
    }
}
