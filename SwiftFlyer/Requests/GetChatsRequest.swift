//
//  GetChatsRequest.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public final class GetChatsRequest: Requestable {
    
    public typealias Response = [Chat]
    
    public var path: String {
        return "/v1/getchats"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var queryParameters: [String : Any] {
        var q: [String: Any] = [:]
        q.appendingQueryParameter(key: "from_date", value: fromDate)
        return q
    }
    
    /// e.g. 2018-01-7T05:58:08.833
    public let fromDate: String?
    
    public init(fromDate: String? = nil) {
        self.fromDate = fromDate
    }
}
