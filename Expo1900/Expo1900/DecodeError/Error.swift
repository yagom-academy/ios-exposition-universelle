//
//  Error.swift
//  Expo1900
//
//  Created by Seoyeon Hong on 2023/02/28.
//

import Foundation

enum DecodeError: Error {
    case expositionDecodeError
    case expoItemDecodeError

    static let title = NSLocalizedString("오류가 발생했습니다.", comment: "오류 발생")
}

extension DecodeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .expositionDecodeError:
            return NSLocalizedString("박람회 정보를 불러오는데 실패했습니다.", comment: "박람회정보 오류")
        case .expoItemDecodeError:
            return NSLocalizedString("출품작의 상세정보를 불러오는데 실패했습니다.", comment: "상세정보 오류")
        }
    }
}
