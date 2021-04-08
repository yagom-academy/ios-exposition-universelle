//
//  CustomJSONDecoder.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/07.
//

import UIKit

/// Decodable 프로토콜을 준수하는 타입에 대해 타입 이름과 파일 이름 입력만으로 JSON 디코딩을 도와주는 메서드를 제공하는 타입.
class CustomJSONDecoder {
  /// 변환할 타입과 JSON 파일 이름을 전달인자로 받아 지정된 타입으로 디코딩 결과를 반환한다.
  /// - 전달인자에 유효하지 않은 JSON 파일을 입력할 경우 `ExpoAppError.invalidJSONFile` 에러를 던진다.
  /// - JSON 파일 형식이 맞지 않는 등 기타 에러는 `JSONDecoder().decode(_:from:)` 메서드의 에러 형식을 따른다.
  /// - Parameter type: 변환할 타입. 모델 타입의 인스턴스를 원하면, `모델타입.self`로 작성한다.
  /// -  Parameter jsonFileName: JSON 파일 이름을 `String` 타입으로 작성한다.
  public func decode<Decoded>(to type: Decoded.Type, from jsonFileName: String) throws -> Decoded? where Decoded: Decodable {
    var decodedResult: Decoded?
    let jsonDecoder = JSONDecoder()
    guard let jsonData: NSDataAsset = NSDataAsset(name: jsonFileName) else {
      throw ExpoAppError.invalidJSONFileName
    }
    
    decodedResult = try jsonDecoder.decode(Decoded.self, from: jsonData.data)
    
    return decodedResult
  }
}
