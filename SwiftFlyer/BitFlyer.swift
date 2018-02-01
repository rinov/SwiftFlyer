//
//  BitFlyer.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public final class BitFyler {

    public enum Const {
        public static let maximumPrivateApiCallPerMinute = 200
        public static let maximumApiCallPerIP = 500
    }
    
    public static var apiKey = ""
    public static var apiSecretKey = ""
}
