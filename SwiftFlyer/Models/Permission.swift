//
//  Permission.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public struct Permission: Codable {
    public let scopes: [String]

    public init(scopes: [String]) {
        self.scopes = scopes
    }
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var result: [String] = []
        while !container.isAtEnd {
            guard let permission = try? container.decode(String.self) else { continue }
            result.append(permission)
        }
        scopes = result
    }
}

extension Permission: Equatable {
    public static func ==(lhs: Permission, rhs: Permission) -> Bool {
        return lhs.scopes == rhs.scopes
    }
}
