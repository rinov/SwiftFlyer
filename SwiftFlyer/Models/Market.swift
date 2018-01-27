//
//  BFMarket.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public struct Market: Codable {
    public let productCode: ProductCode
    public let alias: String?

    public init(productCode: ProductCode, alias: String?) {
        self.productCode = productCode
        self.alias = alias
    }
    
    public enum CodingKeys: String, CodingKey {
        case productCode = "product_code"
        case alias
    }
}

extension Market: Equatable {
    public static func ==(lhs: Market, rhs: Market) -> Bool {
        return lhs.productCode == rhs.productCode
            && lhs.alias == rhs.alias
    }
}
