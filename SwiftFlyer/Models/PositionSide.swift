//
//  PositionSide.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public enum PositionSide: String, Codable {
    case buy = "BUY"
    case sell = "SELL"
    case buysell = "BUYSELL" // Used only parent order like as IFDOCO
    case sellbuy = "SELLBUY" // Used only parent order like as IFDOCO
    case noPosition
}
