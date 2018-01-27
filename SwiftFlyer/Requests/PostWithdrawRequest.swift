//
//  PostWithdrawRequest.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

/// SeeAlso: - https://bitflyer.jp/commission?#DepositCancellation
public final class PostWithdrawRequest: Requestable {
    
    public typealias Response = MessageID
    
    public var path: String {
        return "/v1/me/withdraw"
    }
    
    public var httpMethod: HTTPMethod {
        return .post
    }
    
    public var isAuthorizedRequest: Bool {
        return true
    }
    
    public var httpBody: Data? {
        var json: [String: Any] = [:]
        json.appendingQueryParameter(key: "currency_code", value: currencyCode)
        json.appendingQueryParameter(key: "bank_account_id", value: bankAccountID)
        json.appendingQueryParameter(key: "amount", value: amount)
        json.appendingQueryParameter(key: "code", value: code)
        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        return jsonData
    }
    
    public let currencyCode: CurrencyCode
    public let bankAccountID: Int
    public let amount: Int
    
    /// Two-factor authenticate code
    public let code: String
    
    public init(currencyCode: CurrencyCode,
                bankAccountID: Int,
                amount: Int,
                code: String) {
        self.currencyCode = currencyCode
        self.bankAccountID = bankAccountID
        self.amount = amount
        self.code = code
    }
}
