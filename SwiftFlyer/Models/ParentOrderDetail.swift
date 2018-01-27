//
//  ParentOrderDetail.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct ParentOrderDetail: Codable {
    public let id: Int
    public let minuteToExpire: Int
    public let orderMethod: String
    public let parameters: [ParentOrderParameter]
    public let parentOrderAcceptanceId: String
    public let parentOrderId: String

    public init(id: Int, minuteToExpire: Int, orderMethod: String, parameters: [ParentOrderParameter], parentOrderAcceptanceId: String, parentOrderId: String) {
        self.id = id
        self.minuteToExpire = minuteToExpire
        self.orderMethod = orderMethod
        self.parameters = parameters
        self.parentOrderAcceptanceId = parentOrderAcceptanceId
        self.parentOrderId = parentOrderId
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case minuteToExpire = "minute_to_expire"
        case orderMethod = "order_method"
        case parameters
        case parentOrderAcceptanceId = "parent_order_acceptance_id"
        case parentOrderId = "parent_order_id"
    }
}


extension ParentOrderDetail: Equatable {
    public static func ==(lhs: ParentOrderDetail, rhs: ParentOrderDetail) -> Bool {
        return lhs.id == rhs.id
            && lhs.minuteToExpire == rhs.minuteToExpire
            && lhs.orderMethod == rhs.orderMethod
            && lhs.parameters == rhs.parameters
            && lhs.parentOrderAcceptanceId == rhs.parentOrderAcceptanceId
            && lhs.parentOrderId == rhs.parentOrderId
    }
}

public struct ParentOrderParameter: Codable {
    public let conditionType: String
    public let offset: Int
    public let price: Int
    public let productCode: String
    public let side: String
    public let size: Double
    public let triggerPrice: Int

    public init(conditionType: String, offset: Int, price: Int, productCode: String, side: String, size: Double, triggerPrice: Int) {
        self.conditionType = conditionType
        self.offset = offset
        self.price = price
        self.productCode = productCode
        self.side = side
        self.size = size
        self.triggerPrice = triggerPrice
    }
    
    public enum CodingKeys: String, CodingKey {
        case conditionType = "condition_type"
        case offset
        case price
        case productCode = "product_code"
        case side
        case size
        case triggerPrice = "trigger_price"
    }
}

extension ParentOrderParameter: Equatable {
    public static func ==(lhs: ParentOrderParameter, rhs: ParentOrderParameter) -> Bool {
        return lhs.conditionType == rhs.conditionType
            && lhs.offset == rhs.offset
            && lhs.price == rhs.price
            && lhs.productCode == rhs.productCode
            && lhs.side == rhs.side
            && lhs.size == rhs.size
            && lhs.triggerPrice == rhs.triggerPrice
    }
}
