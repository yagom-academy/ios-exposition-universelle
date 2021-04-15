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
            return "Exposition 파일을 불러올 수 없습니다."
        case .decodeData:
            return "Exposition data를 decode한 결과 nil 입니다."
        case .numberToString:
            return "exposition.visitors를 numberFormatter로 String한 결과 nil 입니다."
        }
    }
}

enum ExpositionItemListError: Error, CustomStringConvertible {
    case readFile
    case decodeData
    
    var description: String {
        switch self {
        case .readFile:
            return "ExpositionItem 파일을 불러올 수 없습니다."
        case .decodeData:
            return "ExpositionItem data를 decode한 결과 nil 입니다."
        }
    }
}

enum ExpositionItemDetailError: Error, CustomStringConvertible {
    case itemImageNameString
    case itemDescriptionString
    case itemNameString
    
    var description: String {
        switch self {
        case .itemImageNameString:
            return "itemImageNameString의 값이 nil 입니다."
        case .itemDescriptionString:
            return "itemDescriptionString의 값이 nil 입니다."
        case .itemNameString:
            return "itemNameString의 값이 nil 입니다."
        }
    }
}
