//
//  Error.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/11.
//

import Foundation

enum DataError: Error {
    case LoadJSON
    case DecodeJSON
}

extension DataError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .LoadJSON:
            return "Failed to load JSON data."
        case .DecodeJSON:
            return "Failed to decode JSON data"
        }
    }
}
