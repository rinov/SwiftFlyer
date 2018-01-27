//
//  TradingCommission.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct TraidingCommission: Codable {
    public let commissionRate: Double

    public init(commissionRate: Double) {
        self.commissionRate = commissionRate
    }
    
    public enum CodingKeys: String, CodingKey {
        case commissionRate = "commission_rate"
    }
}

extension TraidingCommission: Equatable {
    public static func ==(lhs: TraidingCommission, rhs: TraidingCommission) -> Bool {
        return lhs.commissionRate == rhs.commissionRate
    }
}
