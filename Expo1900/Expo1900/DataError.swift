//
//  DataError.swift
//  Expo1900
//
//  Created by 배은서 on 2021/04/15.
//

import Foundation

enum DataError: Error, LocalizedError {
    case incorrectAssert
    case failDecoding
    
    var errorDescription: String? {
        switch self {
        case .incorrectAssert:
            return "잘못된 Assert입니다."
        case .failDecoding:
            return "Decoding 실패🚨"
        }
    }
}
