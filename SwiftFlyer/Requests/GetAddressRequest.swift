//
//  GetAddressRequest.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public final class GetAddressRequest: Requestable {
    
    public typealias Response = [Address]
    
    public var path: String {
        return "/v1/me/getaddresses"
    }
    
    public var isAuthorizedRequest: Bool {
        return true
    }

    public var httpMethod: HTTPMethod {
        return .get
    }

    public init() {}
}
