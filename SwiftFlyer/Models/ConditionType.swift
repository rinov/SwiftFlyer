//
//  ConditionType.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public enum ConditionType: String {
    case limit = "LIMIT"
    case market = "MARKET"
    case stop = "STOP"
    case stopLimit = "STOP_LIMIT"
    case trail = "TRAIL"
}
