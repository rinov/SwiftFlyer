//
//  GetHelthStateRequest.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/02/04.
//

import Foundation

public final class GetHealthStateRequest: Requestable {
    
    public typealias Response = TradeHealth
    
    public var path: String {
        return "/v1/gethealth"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public init() {}
}
