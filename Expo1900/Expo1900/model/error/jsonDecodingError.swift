//
//  jsonDecodingError.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/05.
//

import Foundation

enum jsonDecodingError: Error, CustomStringConvertible {
  case nilHasOccurredWhileUnwrappingData
  case canNotFindJSONPath
  case failedToConvertJSONAsDataFormat
  
  var description: String {
    switch self {
    case .nilHasOccurredWhileUnwrappingData:
      return "데이터를 가져오는 과정에서 옵셔널 해제에 실패하였습니다."
    case .canNotFindJSONPath:
      return "지정된 경로에 JSON파일이 없습니다."
    case .failedToConvertJSONAsDataFormat:
      return "JSON을 데이터로 변환하는데 실패하였습니다."
    }
  }
}
