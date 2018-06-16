//
//  SendChildOrderRequest.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public final class PostChildOrderRequest: Requestable {
    
    public typealias Response = ChildOrderResult
    
    public var path: String {
        return "/v1/me/sendchildorder"
    }
    
    public var httpMethod: HTTPMethod {
        return .post
    }
    
    public var isAuthorizedRequest: Bool {
        return true
    }
    
    public var httpBody: Data? {
        var json: [String: Any] = [:]
        
        json.appendingQueryParameter(key: "product_code", value: productCode)
        json.appendingQueryParameter(key: "child_order_type", value: childOrderType)
        json.appendingQueryParameter(key: "side", value: side)
        json.appendingQueryParameter(key: "price", value: price)
        json.appendingQueryParameter(key: "minute_to_expire", value: minuteToExpire)
        json.appendingQueryParameter(key: "time_in_force", value: timeInForce)
        json["size"] = "\(size)"
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])

        return jsonData
    }
    
    public let productCode: ProductCode
    public let childOrderType: ChildOrderType
    public let side: PositionSide
    public let price: Double?
    public let size: Double
    public let minuteToExpire: Int?
    public let timeInForce: TimeInForce?
    
    public init(productCode: ProductCode,
                childOrderType: ChildOrderType,
                side: PositionSide,
                price: Double?,
                size: Double,
                minuteToExpire: Int? = nil,
                timeInForce: TimeInForce? = nil
                ) {
        self.productCode = productCode
        self.childOrderType = childOrderType
        self.side = side
        self.price = price
        self.size = size
        self.minuteToExpire = minuteToExpire
        self.timeInForce = timeInForce
    }
}


