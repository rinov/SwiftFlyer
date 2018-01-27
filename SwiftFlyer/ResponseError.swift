//
//  ResponseError.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public enum ResponseError: Error {
    case unacceptableStatusCode(Int)
    case unexpectedResponse(Any)
}
