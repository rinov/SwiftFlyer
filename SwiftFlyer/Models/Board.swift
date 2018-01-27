//
//  Board.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct Board: Codable {
    public let asks: [BoardOrder]
    public let bids: [BoardOrder]
    public let midPrice: Double

    public init(asks: [BoardOrder], bids: [BoardOrder], midPrice: Double) {
        self.asks = asks
        self.bids = bids
        self.midPrice = midPrice
    }
    
    public enum CodingKeys: String, CodingKey {
        case asks
        case bids
        case midPrice = "mid_price"
    }
}

extension Board: Equatable {
    public static func ==(lhs: Board, rhs: Board) -> Bool {
        return lhs.asks == rhs.asks
            && lhs.bids == rhs.bids
            && lhs.midPrice == rhs.midPrice
    }
}

public struct BoardOrder: Codable {
    public let price: Double
    public let size: Double

    public init(price: Double, size: Double) {
        self.price = price
        self.size = size
    }
}

extension BoardOrder: Equatable {
    public static func ==(lhs: BoardOrder, rhs: BoardOrder) -> Bool {
        return lhs.price == rhs.price
            && lhs.size == rhs.size
    }
}
