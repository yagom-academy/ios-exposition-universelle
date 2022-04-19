//
//  ParseError.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/19.
//

import Foundation

enum ParseError: Error {
  case invalidName
  case decodeFail
}

extension ParseError: LocalizedError {
  
  var errorDescription: String? {
    switch self {
    case .invalidName:
      return "파일 이름이 잘못됬습니다"
    case .decodeFail:
      return "디코딩이 실패했습니다"
    }
  }
}
