//
//  NSDataAssetError.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/29.
//

import Foundation

enum NSDataAssetError: Error, LocalizedError {
    case invalidDataAsset
    
    var errorDescription: String? {
        switch self {
        case .invalidDataAsset:
            return "InvalidDataAsset"
        }
    }
}
