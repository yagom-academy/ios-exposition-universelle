//
//  ExpoAppError.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/07.
//

enum ExpoAppError: Error, CustomDebugStringConvertible, Equatable {
  case invalidJSONFileName(String)
  case invalidJSONFormat(String)
  case foundNil(String)
  case numberFormattingFailed(Int)
  case unknownError(String)
  
  var debugDescription: String {
    switch self {
    case .invalidJSONFileName(let fileName):
      return "📃 존재하지 않는 JSON 파일이에요. 파일 이름을 다시 확인해주세요! 파일 이름: \(fileName)"
    case .invalidJSONFormat(let fileName):
      return "📑 JSON 형식이 맞지 않아요. 데이터를 다시 확인해주세요. 파일 이름: \(fileName)"
    case .foundNil(let valueName):
      return "😵 이 값은 nil이에요! 값 이름: \(valueName)"
    case .numberFormattingFailed(let number):
      return "😅 숫자 형식 변환에 실패했어요! 숫자를 다시 확인해주세요. 입력한 숫자: \(number)"
    case .unknownError(let location):
      return "𝙛 알 수 없는 에러가 발생했어요! 발생 위치: \(location)"
    }
  }
}
