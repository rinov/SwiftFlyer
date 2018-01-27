//
//  Executions.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct Execution: Codable {
    public let id: Int
    public let side: PositionSide
    public let price: Double
    public let size: Double
    public let execDate: String
    public let buyChildOrderAcceptanceID: String
    public let sellChildOrderAcceptanceID: String

    public init(id: Int, side: PositionSide, price: Double, size: Double, execDate: String, buyChildOrderAcceptanceID: String, sellChildOrderAcceptanceID: String) {
        self.id = id
        self.side = side
        self.price = price
        self.size = size
        self.execDate = execDate
        self.buyChildOrderAcceptanceID = buyChildOrderAcceptanceID
        self.sellChildOrderAcceptanceID = sellChildOrderAcceptanceID
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case side
        case price
        case size
        case execDate = "exec_date"
        case buyChildOrderAcceptanceID = "buy_child_order_acceptance_id"
        case sellChildOrderAcceptanceID = "sell_child_order_acceptance_id"
    }
}

extension Execution: Equatable {
    public static func ==(lhs: Execution, rhs: Execution) -> Bool {
        return lhs.id == rhs.id
            && lhs.side == rhs.side
            && lhs.price == rhs.price
            && lhs.size == rhs.size
            && lhs.execDate == rhs.execDate
            && lhs.buyChildOrderAcceptanceID == rhs.buyChildOrderAcceptanceID
            && lhs.sellChildOrderAcceptanceID == rhs.sellChildOrderAcceptanceID
    }
}

