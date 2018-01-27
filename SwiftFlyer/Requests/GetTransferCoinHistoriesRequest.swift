//
//  GetTransferCoinHistoriesRequest.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public final class GetTransferCoinHistoriesRequest: Requestable {
    
    public typealias Response = [Address]
    
    public var path: String {
        return "/v1/me/getcoinouts"
    }
    
    public var isAuthorizedRequest: Bool {
        return true
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var queryParameters: [String : Any] {
        var q: [String: Any] = [:]
        q.appendingQueryParameter(key: "count", value: count)
        q.appendingQueryParameter(key: "before", value: before)
        q.appendingQueryParameter(key: "after", value: after)
        return q
    }
    
    public let count: Int?
    public let before: String?
    public let after: String?
    
    public init(count: Int? = nil,
                before: String? = nil,
                after: String? = nil) {
        self.count = count
        self.before = before
        self.after = after
    }
}
