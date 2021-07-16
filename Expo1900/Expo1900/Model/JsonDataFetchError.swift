//
//  ExpositionInformationError.swift
//  Expo1900
//
//  Created by Ellen on 2021/07/16.
//

import Foundation

enum JsonDataFetchError: Error {
    case dataNotFound
    case failDecoding
    
    var description: (title: String, message: String) {
        switch self {
        case .dataNotFound:
            return ("Error", "데이터가 없습니다.")
        case .failDecoding:
            return ("Error", "데이터 변환에 실패하였습니다.")
        }
    }
}
