//
//  DecodeError.swift
//  Expo1900
//
//  Created by 조민호 on 2022/04/13.
//

import Foundation

enum DecodeError: Error {
  case notFoundAsset
  case decodeFail
}

extension DecodeError {
  var decription: String {
    switch self {
    case .notFoundAsset:
      return "에셋을 찾을 수 없습니다."
    case .decodeFail:
      return "서버와 연결에 실패했습니다."
    }
  }
}
