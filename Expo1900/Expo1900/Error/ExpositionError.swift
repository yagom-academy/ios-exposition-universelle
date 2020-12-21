//
//  ExpositionError.swift
//  Expo1900
//
//  Created by Wonhee on 2020/12/22.
//

import Foundation

enum ExpositionError: Error {
    case getExpositionData
    case getKoreaItemsData
    case convertNumber
    case unknown
}

extension ExpositionError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .getExpositionData:
            return "박람회 정보를 가져오는데 실패했습니다.\n잠시 후 다시 시도해주세요."
        case .getKoreaItemsData:
            return "한국의 출품작을 가져오는데 실피했습니다.\n잠시 후 다시 시도해주세요."
        case .convertNumber:
            return "숫자를 변환하는데 문제가 있습니다.\n잠시 후 다시 시도해주세요."
        case .unknown:
            return "알 수 없는 오류가 발생했습니다.\n잠시 후 다시 시도해주세요."
        }
    }
}
