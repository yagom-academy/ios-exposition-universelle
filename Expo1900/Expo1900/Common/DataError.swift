//
//  Error.swift
//  Expo1900
//
//  Created by Kyo, tottalE on 2022/10/19.
//

enum DataError: Error {
    case noneDataError
    case decodingError
    case unknownError
    case formattingError
    
    var message: String {
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
