//
//  GetPermissionsRequest.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public final class GetPermissionsRequest: Requestable {
    
    public typealias Response = Permission
    
    public var path: String {
        return "/v1/me/getpermissions"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var isAuthorizedRequest: Bool {
        return true
    }
    
    public init() {}
}

