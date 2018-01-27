//
//  ParentOrderResult.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct ParentOrderResult: Codable {
    public let parentOrderAcceptanceID: String

    public init(parentOrderAcceptanceID: String) {
        self.parentOrderAcceptanceID = parentOrderAcceptanceID
    }
    
    public enum CodingKeys: String, CodingKey {
        case parentOrderAcceptanceID = "parent_order_acceptance_id"
    }
}

extension ParentOrderResult: Equatable {
    public static func ==(lhs: ParentOrderResult, rhs: ParentOrderResult) -> Bool {
        return lhs.parentOrderAcceptanceID == rhs.parentOrderAcceptanceID
    }
}
