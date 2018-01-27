//
//  Collateral.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct Collateral: Codable {
    public let collateral: Double
    public let keepRate: Double
    public let openPositionPnl: Double
    public let requireCollateral: Double

    public init(collateral: Double, keepRate: Double, openPositionPnl: Double, requireCollateral: Double) {
        self.collateral = collateral
        self.keepRate = keepRate
        self.openPositionPnl = openPositionPnl
        self.requireCollateral = requireCollateral
    }
    
    public enum CodingKeys: String, CodingKey {
        case collateral
        case keepRate = "keep_rate"
        case openPositionPnl = "open_position_pnl"
        case requireCollateral = "require_collateral"
    }
}

extension Collateral: Equatable {
    public static func ==(lhs: Collateral, rhs: Collateral) -> Bool {
        return lhs.collateral == rhs.collateral
            && lhs.keepRate == rhs.keepRate
            && lhs.openPositionPnl == rhs.openPositionPnl
            && lhs.requireCollateral == rhs.requireCollateral
    }
}
