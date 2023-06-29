//
//  NSDataAssetError.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/28.
//

import Foundation

enum NSDataAssetError: Error {
    case assetNotFound
}

extension NSDataAssetError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .assetNotFound:
            return "JSON Asset을 찾지 못했습니다."
        }
    }
}
