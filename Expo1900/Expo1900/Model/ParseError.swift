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
      return "파일명 오류"
    case .decodeFail:
      return "디코딩 실패"
    }
  }
}
