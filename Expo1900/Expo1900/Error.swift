//
//  Error.swift
//  Expo1900
//
//  Created by ysp on 2021/04/13.
//

import Foundation

enum ExpositionError: Error, CustomStringConvertible {
    case readFile
    case decodeData
    case numberToString

    var description: String {
        switch self {
        case .readFile:
            return "파일을 불러올 수 없습니다."
        case .decodeData:
            return "data를 decode한 결과 nil 입니다."
        case .numberToString:
            return "exposition.visitors를 numberFormatter로 String한 결과 nil 입니다."
        }
    }
}
