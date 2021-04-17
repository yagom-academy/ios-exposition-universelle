//
//  Error.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/06.
//

import Foundation

enum ExpositionError: Error, CustomDebugStringConvertible {
    case jsonFormatFailed(fileName: String)
    case wrongJsonFileName(fileName: String)
    case wrongImageName(fileName: String)
    
    var debugDescription: String {
        switch self {
        case .jsonFormatFailed(fileName: let fileName):
            return "😢 \(fileName).json파일의 디코딩 과정에서 오류가 발생했어요"
        case .wrongJsonFileName(fileName: let fileName):
            return "😢 \(fileName).json을 찾을 수 없어요"
        case .wrongImageName(fileName: let fileName):
            return "😢 이미지 파일 : \(fileName)를 찾을 수 없어요"
        }
    }
}
