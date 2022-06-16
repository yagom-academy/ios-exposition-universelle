//
//  ExpoError.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/15.
//

import Foundation
enum EXPOError: Error {
    case decoding
}

extension EXPOError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decoding:
            return NSLocalizedString("decoding error", comment: "Description of Decoding Error")
        }
    }
}
