//
//  CustomJSONDecoder.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/07.
//

import UIKit

/// Decodable 프로토콜을 준수하는 타입에 대해 타입 이름과 파일 이름 입력만으로 JSON 디코딩을 도와주는 메서드를 제공하는 타입.
struct CustomJSONDecoder {
  static let jsonDecoder = JSONDecoder()
  
  /// 변환할 타입과 JSON 파일 이름을 전달인자로 받아 지정된 타입으로 디코딩 결과를 반환한다.
  /// - 전달인자에 유효하지 않은 JSON 파일을 입력할 경우 `.failure(ExpoAppError.invalidJSONFileName)` 형식으로 에러를 반환한다.
  /// - JSON 파일 형식이 맞지 않아 디코딩이 실패하는 경우 `.failure(ExpoAppError.invalidJSONFormat)` 형식으로 에러를 반환한다.
  /// - Parameter type: 변환할 타입. 모델 타입의 인스턴스를 원하면, `모델타입.self`로 작성한다.
  /// -  Parameter jsonFileName: JSON 파일 이름을 `String` 타입으로 작성한다.
  static func decode<Decoded>(to type: Decoded.Type, from jsonFileName: String) -> Result<Decoded, ExpoAppError> where Decoded: Decodable {
    var decodedResult: Decoded
    guard let jsonData: NSDataAsset = NSDataAsset(name: jsonFileName) else {
      return .failure(ExpoAppError.invalidJSONFileName(jsonFileName))
    }
    
    do {
      decodedResult = try jsonDecoder.decode(Decoded.self, from: jsonData.data)
    } catch {
      return .failure(ExpoAppError.invalidJSONFormat(jsonFileName))
    }
    
    return .success(decodedResult)
  }
}
