//
//  ExpoError.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/05.
//

import Foundation

enum ExpoError: Error {
    case expoData
    case itemsData
    case detailData
    case unknown
}

extension ExpoError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .expoData:
            return "만국박람회 데이터에 오류가 발생했습니다."
        case .itemsData:
            return "출품된 목록들의 오류가 발생했습니다."
        case .detailData:
            return "출품된 목록의 상세정보에 오류가 발생했습니다."
        case .unknown:
            return "알 수 없는 오류가 발생했습니다."
        }
    }
}
