//
//  ExpositionError.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/25.
//

import Foundation

enum ExpositionError: Error {
    case noDataAsset
    case canNotDecodeData
    case canNotLoadView
    case canNotLoadTableViewCell
    case unknownError
}

extension ExpositionError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .canNotDecodeData:
            return "데이터를 받아올 수 없습니다!! \nApp을 종료했다가 다시 실행해주세요"
        case .canNotLoadView:
            return "화면을 불러올 수 없습니다!! \nApp을 종료했다가 다시 실행해주세요"
        case .noDataAsset:
            return "불러올 데이터가 없습니다!! \nApp을 종료했다가 다시 실행해주세요"
        case .canNotLoadTableViewCell:
            return "목록을 불러올 수 없습니다!! \nApp을 종료했다가 다시 실행해주세요"
        case .unknownError:
            return "알 수 없는 에러가 발생했습니다."
        }
    }
}
