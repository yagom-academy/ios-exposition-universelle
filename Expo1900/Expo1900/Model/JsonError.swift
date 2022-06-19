//
//  JsonError.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/16.
//

enum JsonError: Error {
    case decodingFailure
    case noneFile
}

extension JsonError {
    var message: String {
        switch self {
        case .decodingFailure:
            return "JSON파일 디코딩을 실패했습니다.!"
        case .noneFile:
            return "JSON파일이 없습니다.!"
        }
    }
}
