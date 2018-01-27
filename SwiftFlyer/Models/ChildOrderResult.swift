//
//  ChildOrderResult.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct ChildOrderResult: Codable {
    public let childOrderAcceptanceID: String

    public init(childOrderAcceptanceID: String) {
        self.childOrderAcceptanceID = childOrderAcceptanceID
    }
    
    public enum CodingKeys: String, CodingKey {
        case childOrderAcceptanceID = "child_order_acceptance_id"
    }
}


extension ChildOrderResult: Equatable {
    public static func ==(lhs: ChildOrderResult, rhs: ChildOrderResult) -> Bool {
        return lhs.childOrderAcceptanceID == rhs.childOrderAcceptanceID
    }
}
