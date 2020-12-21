//
//  ExpoError.swift
//  Expo1900
//
//  Created by Wonhee on 2020/12/22.
//

import Foundation

enum ExpoError: Error {
    case getExpositionData
}

extension ExpoError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .getExpositionData:
            return "박람회 정보를 가져오는데 실패했습니다.\n잠시 후 다시 시도해주세요."
        }
    }
}
