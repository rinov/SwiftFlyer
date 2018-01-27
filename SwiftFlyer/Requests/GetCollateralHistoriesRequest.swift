//
//  GetCollateralHistoriesRequest.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public final class GetCollateralHistoriesRequest: Requestable {
    
    public typealias Response = [CollateralHistory]
    
    public var path: String {
        return "/v1/me/getcollateralhistory"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var isAuthorizedRequest: Bool {
        return true
    }
    
    public var queryParameters: [String : Any] {
        var q: [String: Any] = [:]
        q.appendingQueryParameter(key: "count", value: count)
        q.appendingQueryParameter(key: "before", value: before)
        q.appendingQueryParameter(key: "after", value: after)
        
        return q
    }
    
    public let count: Int? // The default value is 100.
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

