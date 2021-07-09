//
//  ParsingError.swift
//  Expo1900
//
//  Created by JINHONG AN on 2021/07/08.
//

import Foundation

enum ParsingError: Error, LocalizedError {
    case dataSetNotFound
    case decodingFailed
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .dataSetNotFound:
            return "해당하는 데이터 파일을 찾지 못했습니다."
        case .decodingFailed:
            return "디코딩에 실패했습니다."
        case .unknown:
            return "알 수 없는 오류가 발생했습니다."
        }
    }
}
