//
//  GetBoardRequest.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public final class GetBoardRequest: Requestable {
    
    public typealias Response = Board
    
    public var path: String {
        return "/v1/getboard"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var queryParameters: [String : Any] {
        var q: [String: Any] = [:]
        q.appendingQueryParameter(key: "product_code", value: productCode)
        return q
    }
    
    public let productCode: ProductCode
    
    public init(productCode: ProductCode) {
        self.productCode = productCode
    }
}
