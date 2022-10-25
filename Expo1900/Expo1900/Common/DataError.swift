//
//  Error.swift
//  Expo1900
//
//  Created by Kyo, tottalE on 2022/10/19.
//

import Foundation

enum DataError: Error {
    case noneDataError
    case decodingError
    case unknownError
    case formattingError
}

extension DataError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noneDataError:
            return "NoneData Error"
        case .decodingError:
            return "Decoding Error"
        case .formattingError:
            return "Formatting Error"
        case .unknownError:
            return "Unknown Error"
        }
    }
}
