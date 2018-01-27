//
//  Position.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct Position: Decodable {
    public let commission: Double
    public let leverage: Int
    public let openDate: String
    public let pnl: Double
    public let price: Double
    public let productCode: String
    public let requireCollateral: Double
    public let side: PositionSide
    public let size: Double
    public let swapPointAccumulate: Double

    public init(commission: Double, leverage: Int, openDate: String, pnl: Double, price: Double, productCode: String, requireCollateral: Double, side: PositionSide, size: Double, swapPointAccumulate: Double) {
        self.commission = commission
        self.leverage = leverage
        self.openDate = openDate
        self.pnl = pnl
        self.price = price
        self.productCode = productCode
        self.requireCollateral = requireCollateral
        self.side = side
        self.size = size
        self.swapPointAccumulate = swapPointAccumulate
    }
    
    public enum CodingKeys: String, CodingKey {
        case commission
        case leverage
        case openDate = "open_date"
        case pnl
        case price
        case productCode = "product_code"
        case requireCollateral = "require_collateral"
        case side
        case size
        case swapPointAccumulate = "swap_point_accumulate"
    }
}

extension Position: Equatable {
    public static func ==(lhs: Position, rhs: Position) -> Bool {
        return lhs.commission == rhs.commission
            && lhs.leverage == rhs.leverage
            && lhs.openDate == rhs.openDate
            && lhs.pnl == rhs.pnl
            && lhs.price == rhs.price
            && lhs.productCode == rhs.productCode
            && lhs.requireCollateral == rhs.requireCollateral
            && lhs.side == rhs.side
            && lhs.size == rhs.size
            && lhs.swapPointAccumulate == rhs.swapPointAccumulate
    }
}
