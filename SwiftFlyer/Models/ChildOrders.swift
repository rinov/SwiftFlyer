//
//  ChildOrders.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

typealias ChildOrders = [ChildOrder]

public struct ChildOrder: Decodable {
    public let averagePrice: Double
    public let cancelSize: Double
    public let childOrderAcceptanceId: String
    public let childOrderDate: String
    public let childOrderId: String
    public let childOrderState: OrderState
    public let childOrderType: String
    public let executedSize: Double
    public let expireDate: String
    public let id: Int
    public let outstandingSize: Double
    public let price: Double
    public let productCode: String
    public let side: String
    public let size: Double
    public let totalCommission: Double

    public init(averagePrice: Double, cancelSize: Double, childOrderAcceptanceId: String, childOrderDate: String, childOrderId: String, childOrderState: OrderState, childOrderType: String, executedSize: Double, expireDate: String, id: Int, outstandingSize: Double, price: Double, productCode: String, side: String, size: Double, totalCommission: Double) {
        self.averagePrice = averagePrice
        self.cancelSize = cancelSize
        self.childOrderAcceptanceId = childOrderAcceptanceId
        self.childOrderDate = childOrderDate
        self.childOrderId = childOrderId
        self.childOrderState = childOrderState
        self.childOrderType = childOrderType
        self.executedSize = executedSize
        self.expireDate = expireDate
        self.id = id
        self.outstandingSize = outstandingSize
        self.price = price
        self.productCode = productCode
        self.side = side
        self.size = size
        self.totalCommission = totalCommission
    }
    
    public enum CodingKeys: String, CodingKey {
        case averagePrice = "average_price"
        case cancelSize = "cancel_size"
        case childOrderAcceptanceId = "child_order_acceptance_id"
        case childOrderDate = "child_order_date"
        case childOrderId = "child_order_id"
        case childOrderState = "child_order_state"
        case childOrderType = "child_order_type"
        case executedSize = "executed_size"
        case expireDate = "expire_date"
        case id
        case outstandingSize = "outstanding_size"
        case price
        case productCode = "product_code"
        case side
        case size
        case totalCommission = "total_commission"
    }
}

extension ChildOrder: Equatable {
    public static func ==(lhs: ChildOrder, rhs: ChildOrder) -> Bool {
        return lhs.averagePrice == rhs.averagePrice
            && lhs.cancelSize == rhs.cancelSize
            && lhs.childOrderAcceptanceId == rhs.childOrderAcceptanceId
            && lhs.childOrderDate == rhs.childOrderDate
            && lhs.childOrderId == rhs.childOrderId
            && lhs.childOrderState == rhs.childOrderState
            && lhs.childOrderType == rhs.childOrderType
            && lhs.executedSize == rhs.executedSize
            && lhs.expireDate == rhs.expireDate
            && lhs.id == rhs.id
            && lhs.outstandingSize == rhs.outstandingSize
            && lhs.price == rhs.price
            && lhs.productCode == rhs.productCode
            && lhs.side == rhs.side
            && lhs.size == rhs.size
            && lhs.totalCommission == rhs.totalCommission
    }
}

