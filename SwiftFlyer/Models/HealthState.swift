//
//  HealthState.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public enum HealthState: String, Codable {
    case normal    = "NORMAL"
    case busy      = "BUSY"
    case veryBusy  = "VERY BUSY"
    case superBusy = "SUPER BUSY"
}
