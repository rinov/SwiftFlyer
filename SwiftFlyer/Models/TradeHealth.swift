//
//  TradeHealth.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/02/04.
//

import Foundation

public struct TradeHealth: Codable {

    public let healthState: HealthState
    
    public enum CodingKeys: String, CodingKey {
        case healthState = "status"
    }
}
