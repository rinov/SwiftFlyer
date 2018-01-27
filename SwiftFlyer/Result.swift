//
//  Result.swift
//  SwiftFlyer
//
//  Created by Ryo Ishikawa on 2018/01/28.
//  Copyright © 2017 Ryo Ishikawa. All rights reserved.
//

import Foundation

public enum Result<T, E> {
    case success(T)
    case failed(E)
    
    var isSuccess: Bool {
        if case .success(_) = self {
            return true
        }
        return false
    }
    
    var isFailed: Bool {
        if case .failed(_) = self {
            return true
        }
        return false
    }
}

