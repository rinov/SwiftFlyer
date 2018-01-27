//
//  TradeState.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public enum TradeState: String, Codable {
    case running      = "RUNNING"
    case closed       = "CLOSED"
    case starting     = "STARTING"
    case preopen      = "PREOPEN"
    case circuitBreak = "CIRCUIT BREAK"
    case awaitingSQ   = "AWATING SQ"
    case matured      = "MATURED"
}
