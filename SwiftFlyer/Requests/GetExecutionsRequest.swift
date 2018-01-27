//
//  GetExecutionsRequest.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public final class GetExecutionsRequest: Requestable {
    
    public typealias Response = [Execution]
    
    public var path: String {
        return "/v1/getexecutions"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var queryParameters: [String : Any] {
        var q: [String: Any] = [:]
        q.appendingQueryParameter(key: "product_code", value: productCode)
        q.appendingQueryParameter(key: "count", value: count)
        q.appendingQueryParameter(key: "before", value: before)
        q.appendingQueryParameter(key: "after", value: after)
        return q
    }
    
    public let productCode: ProductCode
    public let count: Int?
    public let before: Int?
    public let after: Int?
    
    public init(productCode: ProductCode,
                count: Int? = nil,
                before: Int? = nil,
                after: Int? = nil) {
        self.productCode = productCode
        self.count = count
        self.before = before
        self.after = after
    }
}
