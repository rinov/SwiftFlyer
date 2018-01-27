//
//  RequestableExtensions.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import  Foundation
import CryptoSwift

public extension Requestable {
    
    public var baseURL: URL {
        return URL(string: "https://api.bitflyer.jp")!
    }
    
    public var queryParameters: [String: Any] {
        return [:]
    }
    
    public var headerField: [String: String] {
        return [:]
    }
    
    public var isAuthorizedRequest: Bool {
        return false
    }
    
    public var httpBody: Data? {
        return nil
    }
    
    public var isNoContent: Bool {
        return false
    }
    
    public func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var urlRequest = URLRequest(url: url)
        var header: [String: String] = headerField

        urlRequest.httpMethod = httpMethod.rawValue
        
        // Set custom header filed if the request needs authorization.
        if isAuthorizedRequest {
            let timeStamp = String(Date().timeIntervalSince1970)
            header["Content-Type"] = "application/json"
            header["ACCESS-KEY"] = BitFyler.apiKey
            header["ACCESS-TIMESTAMP"] = timeStamp
            header["ACCESS-SIGN"] = makeAccessSignWith(accessKey: BitFyler.apiKey,
                                                       timeStamp: timeStamp,
                                                       method: httpMethod,
                                                       path: path,
                                                       queryParams: queryParameters,
                                                       body: httpBody)
        }
        
        header.forEach { key, value in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        if let body = httpBody {
            urlRequest.httpBody = body
        }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return urlRequest
        }
        
        urlComponents.query = queryParameters
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
        urlRequest.url = urlComponents.url
        return urlRequest
    }
    
    private func makeAccessSignWith(accessKey: String, timeStamp: String, method: HTTPMethod, path: String, queryParams: [String: Any], body: Data?) -> String? {
        
        var bytes: [UInt8] = []

        bytes += timeStamp.bytes
        bytes += httpMethod.rawValue.bytes
        bytes += path.bytes
        
        if !queryParams.isEmpty {
            let requestBody = "?" + queryParams
                .map { "\($0.key)=\($0.value)" }
                .joined(separator: "&")
            bytes += requestBody.bytes
        }
        
        if body?.isEmpty == false {
            if let bodyParameter = body,
                let bodyString = String(data: bodyParameter, encoding: .utf8) {
                bytes += bodyString.bytes
            }
        }
        
        // Encrypt with HMAC sha256.
        let signedString = try? HMAC(key: BitFyler.apiSecretKey, variant: .sha256).authenticate(bytes)
        
        return signedString?.toHexString()
    }
    
}
