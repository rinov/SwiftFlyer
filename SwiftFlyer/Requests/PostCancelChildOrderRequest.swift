//
//  PostOrderCancelRequest.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public final class PostCancelChildOrderRequest: Requestable {
    
    public typealias Response = OnlyStatusCodeResponse
    
    public var path: String {
        return "/v1/me/cancelchildorder"
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
        json.appendingQueryParameter(key: "child_order_id", value: childOrderID)
        json.appendingQueryParameter(key: "child_order_acceptance_id", value: childOrderAcceptanceID)

        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        
        return jsonData
    }

    public let productCode: ProductCode
    public let childOrderID: String?
    public let childOrderAcceptanceID: String?
    
    public init(productCode: ProductCode,
                childOrderID: String? = nil,
                childOrderAcceptanceID: String? = nil
        ) {
        self.productCode = productCode
        self.childOrderID = childOrderID
        self.childOrderAcceptanceID = childOrderAcceptanceID
    }
}
