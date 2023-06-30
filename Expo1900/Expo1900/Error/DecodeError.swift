//
//  DecodeError.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/27.
//

import Foundation

enum DecodeError: LocalizedError {
    case noFile
    
    var errorDescription: String? {
        switch self {
        case .noFile:
            return "파일 없음"
        }
    }
}
