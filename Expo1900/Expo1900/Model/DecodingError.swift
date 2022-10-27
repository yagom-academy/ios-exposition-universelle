//
//  DecodingError.swift
//  DecodingError
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import Foundation

enum DecodingError: Error, LocalizedError {
    case notFoundFile
    case canNotDecode
    
    var errorDescription: String? {
        return Constant.errorMessage
    }
}
