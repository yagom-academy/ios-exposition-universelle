//
//  JSONError.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/16.
//

import Foundation

enum ParseError: LocalizedError {
    case unknown
    
    var description: String {
        switch self {
        case .unknown:
            return NSLocalizedString("unknown data", comment: "unknown data")
        }
    }
}
