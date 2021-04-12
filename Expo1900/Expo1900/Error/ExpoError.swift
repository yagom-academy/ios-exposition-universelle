//
//  ExpoError.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/12.
//

import Foundation

enum ExpoError: Error {
    case invalidExpoData
    case invalidItemData
}

extension ExpoError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidExpoData:
            return "ExpoData를 불러올 수 없습니다"
        case .invalidItemData:
            return "ItemData를 불러올 수 없습니다"
        }
    }
}
