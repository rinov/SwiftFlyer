//
//  DictionaryExtensions.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    mutating func appendingQueryParameter(key: String, value: Any?) {
        if let value = value {
            self[key] = value
        }
    }
    
    mutating func appendingQueryParameter<T: RawRepresentable>(key: String, value: T?) where T.RawValue == String {
        if let value = value {
            self[key] = value.rawValue
        }
    }
    
}
