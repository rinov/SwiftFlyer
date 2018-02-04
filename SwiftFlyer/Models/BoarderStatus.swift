//
//  BoardState.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct BoardState: Codable {
    public let healthState: HealthState
    public let tradeState: TradeState

    public init(healthState: HealthState, tradeState: TradeState) {
        self.healthState = healthState
        self.tradeState = tradeState
    }

    public enum CodingKeys: String, CodingKey {
        case healthState = "health"
        case tradeState = "state"
    }
}

extension BoardState: Equatable {
    public static func ==(lhs: BoardState, rhs: BoardState) -> Bool {
        return lhs.healthState == rhs.healthState
            && lhs.tradeState == rhs.tradeState
    }
}
