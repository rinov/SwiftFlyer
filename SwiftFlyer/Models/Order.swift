//
//  Order.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct Order {
    public let productCode: ProductCode
    public let conditionType: ConditionType
    public let side: PositionSide
    public let price: Double?
    public let triggerPrice: Double?
    public let size: Float
    public let offset: Int?
    public let timeInForce: TimeInForce?

    public init(productCode: ProductCode, conditionType: ConditionType, side: PositionSide, price: Double?, triggerPrice: Double?, size: Float, offset: Int?, timeInForce: TimeInForce?) {
        self.productCode = productCode
        self.conditionType = conditionType
        self.side = side
        self.price = price
        self.triggerPrice = triggerPrice
        self.size = size
        self.offset = offset
        self.timeInForce = timeInForce
    }
}

extension Order: Equatable {
    public static func ==(lhs: Order, rhs: Order) -> Bool {
        return lhs.productCode == rhs.productCode
            && lhs.conditionType == rhs.conditionType
            && lhs.side == rhs.side
            && lhs.price == rhs.price
            && lhs.triggerPrice == rhs.triggerPrice
            && lhs.size == rhs.size
            && lhs.offset == rhs.offset
            && lhs.timeInForce == rhs.timeInForce
    }
}
