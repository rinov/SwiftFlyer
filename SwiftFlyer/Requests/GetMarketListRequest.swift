//
//  GetMarketListRequest.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public final class GetMarketListRequest: Requestable {
    
    public typealias Response = [Market]
    
    public var path: String {
        return "/v1/getmarkets"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public init() {}
}

