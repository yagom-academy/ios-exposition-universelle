//
//  DecoderError.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/28.
//

import Foundation

enum DecoderError: LocalizedError {
    case notFoundAsset
    case decodeFailed
    case unexpectedError
    
    var errorDescription: String? {
        switch self {
        case .notFoundAsset:
            return "에셋을 찾을 수 없습니다."
        case .decodeFailed:
            return "디코딩에 실패했습니다."
        case .unexpectedError:
            return "알 수 없는 에러"
        }
    }
}
