//
//  GetBalanceRequest.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public final class GetBalanceRequest: Requestable {
    
    public typealias Response = [Balance]
    
    public var path: String {
        return "/v1/me/getbalance"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var isAuthorizedRequest: Bool {
        return true
    }
    
    public init() {}
}

