//
//  Requestable.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public protocol Requestable {

    // The response of `Requestable` expects either JSON object or empty.
    associatedtype Response: Decodable

    // The base of URL.
    var baseURL: URL { get }

    // The path of URL.
    var path: String { get }

    // The header field of HTTP.
    var headerField: [String: String] { get }
    
    // If the request needs OAuth authorization, this will set `true`. The default value is `false`.
    var isAuthorizedRequest: Bool { get }
    
    // The http method. e.g. `.get`
    var httpMethod: HTTPMethod { get }
    
    // The http body parameter, The default value is `nil`.
    var httpBody: Data? { get }
    
    // Additional query paramters for URL, The default value is `[:]`.
    var queryParameters: [String: Any] { get }
    
    // If the response is empty, this should be true.
    var isNoContent: Bool { get }
}

