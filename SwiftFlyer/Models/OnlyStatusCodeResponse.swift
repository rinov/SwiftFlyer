//
//  OnlyStatusCodeResponse.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public struct OnlyStatusCodeResponse: Codable {
    public let statusCode: Int
    public let isSuccess: Bool

    public init(statusCode: Int, isSuccess: Bool) {
        self.statusCode = statusCode
        self.isSuccess = isSuccess
    }

    public enum CodingKeys: String, CodingKey {
        case statusCode
        case isSuccess
    }
}

extension OnlyStatusCodeResponse: Equatable {
    public static func ==(lhs: OnlyStatusCodeResponse, rhs: OnlyStatusCodeResponse) -> Bool {
        return lhs.statusCode == rhs.statusCode
            && lhs.isSuccess == rhs.isSuccess
    }
}
