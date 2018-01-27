//
//  Contract.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct Contract: Decodable {
    public let childOrderAcceptanceId: String
    public let childOrderId: String
    public let commission: Int
    public let execDate: String
    public let id: Int
    public let price: Int
    public let side: PositionSide
    public let size: Double

    public init(childOrderAcceptanceId: String, childOrderId: String, commission: Int, execDate: String, id: Int, price: Int, side: PositionSide, size: Double) {
        self.childOrderAcceptanceId = childOrderAcceptanceId
        self.childOrderId = childOrderId
        self.commission = commission
        self.execDate = execDate
        self.id = id
        self.price = price
        self.side = side
        self.size = size
    }
    
    public enum CodingKeys: String, CodingKey {
        case childOrderAcceptanceId = "child_order_acceptance_id"
        case childOrderId = "child_order_id"
        case commission
        case execDate = "exec_date"
        case id
        case price
        case side
        case size
    }
}

extension Contract: Equatable {
    public static func ==(lhs: Contract, rhs: Contract) -> Bool {
        return lhs.childOrderAcceptanceId == rhs.childOrderAcceptanceId
            && lhs.childOrderId == rhs.childOrderId
            && lhs.commission == rhs.commission
            && lhs.execDate == rhs.execDate
            && lhs.id == rhs.id
            && lhs.price == rhs.price
            && lhs.side == rhs.side
            && lhs.size == rhs.size
    }
}
