//
//  ExpoAppError.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/07.
//

enum ExpoAppError: Error, CustomDebugStringConvertible, Equatable {
  case invalidJSONFileName
  case invalidJSONFormat
  case foundNil
  
  var debugDescription: String {
    switch self {
    case .invalidJSONFileName:
      return "📃 존재하지 않는 JSON 파일이에요. 파일 이름을 다시 확인해주세요!"
    case .invalidJSONFormat:
      return "📑 JSON 형식이 맞지 않아요. 데이터를 다시 확인해주세요."
    case .foundNil:
      return "😵 이 값은 nil이에요!"
    }
  }
}
