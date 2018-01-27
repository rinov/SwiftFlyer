//
//  Chat.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public struct Chat: Codable {
    public let nickname: String
    public let message: String
    public let date: String

    public init(nickname: String, message: String, date: String) {
        self.nickname = nickname
        self.message = message
        self.date = date
    }
}

extension Chat: Equatable {
    public static func ==(lhs: Chat, rhs: Chat) -> Bool {
        return lhs.nickname == rhs.nickname
            && lhs.message == rhs.message
            && lhs.date == rhs.date
    }
}
