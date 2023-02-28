//
//  DataAssetError.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/23.
//

enum DataAssetError: Error, Equatable {
    case invalidFileName
}

extension DataAssetError: CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidFileName:
            return "유효하지 않은 파일"
        }
    }
}
