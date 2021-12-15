//
//  JSONDataError.swift
//  Expo1900
//
//  Created by aladdin on 2021/12/09.
//

import Foundation

enum JSONDataError: LocalizedError {
    case fileNotFound(_ fileName: String)
}

extension JSONDataError {
    var description: String {
        switch self {
        case .fileNotFound(let fileName):
            return "\(fileName)이 없습니다"
        }
    }
}
