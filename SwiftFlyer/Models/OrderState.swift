//
//  ChildOrderState.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public enum OrderState: String, Decodable {
    case active     = "ACTIVE"
    case completed  = "COMPLETED"
    case canceled   = "CANCELED"
    case expired    = "EXPIRED"
    case rejected   = "REJECTED"
}
