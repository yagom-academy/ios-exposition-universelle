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
    
    public var failureReason: String? {
        switch self {
        case .noneDataError:
            return "데이터 불러오기 실패"
        case .decodingError:
            return "데이터 디코딩 실패"
        case .formattingError:
            return "데이터 포맷팅 실패"
        case .unknownError:
            return "알 수 없는 오류"
        }
    }
}
