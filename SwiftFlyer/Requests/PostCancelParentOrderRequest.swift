//
//  PostCancelParentOrderRequest.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public final class PostCancelParentOrderRequest: Requestable {
    
    public typealias Response = OnlyStatusCodeResponse
    
    public var path: String {
        return "/v1/me/cancelparentorder"
    }
    
    public var httpMethod: HTTPMethod {
        return .post
    }
    
    public var isAuthorizedRequest: Bool {
        return true
    }
    
    public var isNoContent: Bool {
        return true
    }
    
    public var httpBody: Data? {
        var json: [String: Any] = [:]
        
        json.appendingQueryParameter(key: "product_code", value: productCode)
        json.appendingQueryParameter(key: "parent_order_id", value: parentOrderID)
        json.appendingQueryParameter(key: "parent_order_acceptance_id", value: parentOrderAcceptanceID)
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        
        return jsonData
    }
    
    public let productCode: ProductCode
    public let parentOrderID: String?
    public let parentOrderAcceptanceID: String?
    
    public init(productCode: ProductCode,
                parentOrderID: String? = nil,
                parentOrderAcceptanceID: String? = nil
        ) {
        self.productCode = productCode
        self.parentOrderID = parentOrderID
        self.parentOrderAcceptanceID = parentOrderAcceptanceID
    }
}
