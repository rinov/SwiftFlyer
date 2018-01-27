//
//  PostCancelAllChildOrdersRequest.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public final class PostCancelAllOrdersRequest: Requestable {
    
    public typealias Response = OnlyStatusCodeResponse
    
    public var path: String {
        return "/v1/me/cancelallchildorders"
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
        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        return jsonData
    }
    
    public let productCode: ProductCode
    
    public init(productCode: ProductCode) {
        self.productCode = productCode
    }
}

