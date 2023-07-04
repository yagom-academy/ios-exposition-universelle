//
//  DecodingError.swift
//  Expo1900
//
//  Created by Whales on 2023/07/04.
//

enum DecodingError: Error {
    case failedDecoding
    case unknown
    
    var message: String {
        switch self {
        case .failedDecoding:
            return "데이터를 불러오지 못했습니다."
        case .unknown:
            return "알 수 없는 오류입니다."
        }
    }
}
