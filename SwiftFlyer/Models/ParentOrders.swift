//
//  ParentOrders.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct ParentOrder: Decodable {
    public let averagePrice: Double
    public let cancelSize: Double
    public let executedSize: Double
    public let expireDate: String
    public let id: Int
    public let outstandingSize: Double
    public let parentOrderAcceptanceId: String
    public let parentOrderDate: String
    public let parentOrderId: String
    public let parentOrderState: OrderState
    public let parentOrderType: String
    public let price: Double
    public let productCode: String
    public let side: String
    public let size: Double
    public let totalCommission: Double

    public init(averagePrice: Double, cancelSize: Double, executedSize: Double, expireDate: String, id: Int, outstandingSize: Double, parentOrderAcceptanceId: String, parentOrderDate: String, parentOrderId: String, parentOrderState: OrderState, parentOrderType: String, price: Double, productCode: String, side: String, size: Double, totalCommission: Double) {
        self.averagePrice = averagePrice
        self.cancelSize = cancelSize
        self.executedSize = executedSize
        self.expireDate = expireDate
        self.id = id
        self.outstandingSize = outstandingSize
        self.parentOrderAcceptanceId = parentOrderAcceptanceId
        self.parentOrderDate = parentOrderDate
        self.parentOrderId = parentOrderId
        self.parentOrderState = parentOrderState
        self.parentOrderType = parentOrderType
        self.price = price
        self.productCode = productCode
        self.side = side
        self.size = size
        self.totalCommission = totalCommission
    }
    
    public enum CodingKeys: String, CodingKey {
        case averagePrice = "average_price"
        case cancelSize = "cancel_size"
        case executedSize = "executed_size"
        case expireDate = "expire_date"
        case id
        case outstandingSize = "outstanding_size"
        case parentOrderAcceptanceId = "parent_order_acceptance_id"
        case parentOrderDate = "parent_order_date"
        case parentOrderId = "parent_order_id"
        case parentOrderState = "parent_order_state"
        case parentOrderType = "parent_order_type"
        case price
        case productCode = "product_code"
        case side
        case size
        case totalCommission = "total_commission"
    }
}

extension ParentOrder: Equatable {
    public static func ==(lhs: ParentOrder, rhs: ParentOrder) -> Bool {
        return lhs.averagePrice == rhs.averagePrice
            && lhs.cancelSize == rhs.cancelSize
            && lhs.executedSize == rhs.executedSize
            && lhs.expireDate == rhs.expireDate
            && lhs.id == rhs.id
            && lhs.outstandingSize == rhs.outstandingSize
            && lhs.parentOrderAcceptanceId == rhs.parentOrderAcceptanceId
            && lhs.parentOrderDate == rhs.parentOrderDate
            && lhs.parentOrderId == rhs.parentOrderId
            && lhs.parentOrderState == rhs.parentOrderState
            && lhs.parentOrderType == rhs.parentOrderType
            && lhs.price == rhs.price
            && lhs.productCode == rhs.productCode
            && lhs.side == rhs.side
            && lhs.size == rhs.size
            && lhs.totalCommission == rhs.totalCommission
    }
}

