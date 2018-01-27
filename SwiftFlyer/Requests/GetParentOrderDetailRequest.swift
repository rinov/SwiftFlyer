//
//  GetParentOrderRequest.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public final class GetParentOrderDetailRequest: Requestable {
    
    public typealias Response = [ChildOrder]
    
    public var path: String {
        return "/v1/me/getparentorder"
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
        q.appendingQueryParameter(key: "product_code", value: productCode)
        q.appendingQueryParameter(key: "parent_order_state", value: parentOrderState)
        
        return q
    }
    
    public let productCode: ProductCode
    public let count: Int? // The default value is 100.
    public let before: String?
    public let after: String?
    public let parentOrderState: OrderState?
    
    public init(productCode: ProductCode,
                count: Int? = nil,
                before: String? = nil,
                after: String? = nil,
                parentOrderState: OrderState? = nil) {
        
        self.productCode = productCode
        self.count = count
        self.before = before
        self.after = after
        self.parentOrderState = parentOrderState
    }
}
