//
//  GetChildOrdersRequest.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public final class GetChildOrdersRequest: Requestable {
    
    public typealias Response = [ChildOrder]
    
    public var path: String {
        return "/v1/me/getchildorders"
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
        q.appendingQueryParameter(key: "child_order_state", value: childOrderState)
        q.appendingQueryParameter(key: "child_order_id", value: childOrderID)
        q.appendingQueryParameter(key: "child_order_acceptance_id", value: childOrderAcceptanceID)
        q.appendingQueryParameter(key: "parent_order_id", value: parentOrderID)

        return q
    }
    
    public let productCode: ProductCode
    public let count: Int?
    public let before: String?
    public let after: String?
    public let childOrderState: OrderState?
    public let childOrderID: String?
    public let childOrderAcceptanceID: String?
    public let parentOrderID: String?
    
    public init(productCode: ProductCode,
                count: Int? = nil,
                before: String? = nil,
                after: String? = nil,
                childOrderState: OrderState? = nil,
                childOrderID: String? = nil,
                childOrderAcceptanceID: String? = nil,
                parentOrderID: String? = nil) {
        
        self.productCode = productCode
        self.count = count
        self.before = before
        self.after = after
        self.childOrderState = childOrderState
        self.childOrderID = childOrderID
        self.childOrderAcceptanceID = childOrderAcceptanceID
        self.parentOrderID = parentOrderID
    }
}

