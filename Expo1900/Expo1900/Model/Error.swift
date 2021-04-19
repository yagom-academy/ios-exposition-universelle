//
//  Error.swift
//  Expo1900
//
//  Created by 잼킹 on 2021/04/11.
//

import Foundation

enum ErrorData: Error {
    case dataDecodingError
    case unknown
    
    var errorMassege: String {
        switch self {
        case .dataDecodingError:
            return "데이터를 불러오는데 문제가 발생했습니다."
        default:
            return "알 수 없는 에러입니다."
        }
    }
}
