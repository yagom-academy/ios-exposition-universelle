//
//  ExpoError.swift
//  Expo1900
//
//  Created by 전민수 on 2022/06/15.
//

import Foundation
enum ExpoError: Error {
    case decoding
}

extension ExpoError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decoding:
            return NSLocalizedString("decoding error", comment: "Description of Decoding Error")
        }
    }
}
