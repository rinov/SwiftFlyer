//
//  ApiSession.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public class ApiSession {
    
    public static let shared = ApiSession()
    
    private init() {}

    public func send<T: Requestable>(_ request: T, closure: @escaping (Result<T.Response, Error>) -> Void) {
        
        let urlRequest = request.buildURLRequest()

        let task = URLSession.shared.dataTask(with: urlRequest) { (data, rawResponse, error) in
            
            // If the dataTask error is occured.
            if let error = error {
                closure(.failed(ResponseError.unexpectedResponse(error)))
                return
            }
            
            let statusCode = (rawResponse as? HTTPURLResponse)?.statusCode ?? -1
            
            // Decodable must have data length at least.
            guard let data = data else {
                closure(.failed(ResponseError.unexpectedResponse("Error: The API response is empty.")))
                return
            }
            
            let isValidStatusCode = (200...299) ~= statusCode

            if request.isNoContent {
                let result = OnlyStatusCodeResponse(statusCode: statusCode, isSuccess: isValidStatusCode) as! T.Response
                closure(.success(result))
                return
            }
            
            if !isValidStatusCode {
                closure(.failed(ResponseError.unacceptableStatusCode(statusCode)))
                return
            }
            
            // Decoding the response from `data` and handle DecodingError if occured.
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.Response.self, from: data)
                closure(.success(result))
            } catch DecodingError.keyNotFound(let codingKey, let context) {
                closure(.failed(DecodingError.keyNotFound(codingKey, context)))
            } catch DecodingError.typeMismatch(let type, let context) {
                closure(.failed(DecodingError.typeMismatch(type, context)))
            } catch DecodingError.valueNotFound(let type, let context) {
                closure(.failed(DecodingError.valueNotFound(type, context)))
            } catch DecodingError.dataCorrupted(let context) {
                closure(.failed(DecodingError.dataCorrupted(context)))
            } catch {
                closure(.failed(ResponseError.unexpectedResponse(data)))
            }
        }
        
        task.resume()
    }
}

