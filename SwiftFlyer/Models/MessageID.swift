//
//  MessageID.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public struct MessageID: Codable {
    public let id: String

    public init(id: String) {
        self.id = id
    }
    
    public enum CodingKeys: String, CodingKey {
        case id = "message_id"
    }
}

extension MessageID: Equatable {
    public static func ==(lhs: MessageID, rhs: MessageID) -> Bool {
        return lhs.id == rhs.id
    }
}
