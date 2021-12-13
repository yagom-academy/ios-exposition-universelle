//
//  FormatingError.swift
//  Expo1900
//
//  Created by Seul Mac on 2021/12/13.
//

import Foundation

enum FormatingError: LocalizedError {
    case convertNumberFailed
}

extension FormatingError {
    var description: String {
        switch self {
        case .convertNumberFailed:
            return "숫자 변환에 실패했습니다."
        }
    }
}
