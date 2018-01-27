//
//  GetBankAccountsRequest.swift
//  SwiftFlyer
//  Created by Ryo Ishikawa on 2018/01/28.
//

import Foundation

public final class GetBankAccountsRequest: Requestable {
    
    public typealias Response = [BankAccount]
    
    public var path: String {
        return "/v1/me/getbankaccounts"
    }
    
    public var isAuthorizedRequest: Bool {
        return true
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public init() {}
}
