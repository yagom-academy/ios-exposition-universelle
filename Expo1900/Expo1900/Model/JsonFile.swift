//
//  JsonDecode.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/07.
//

import Foundation

class JsonFile {
  private let fileName: String
  
  init(fileName: String) {
    self.fileName = fileName
  }
  
  func decode<T: Decodable>(type: T) throws -> T {
    let filePath = try jsonPath(fileName)
    let fileString = try jsonString(filePath, type)
    let data = try jsonData(fileString)
    let decodeData = try jsonDecode(data, type)
    
    return decodeData
  }
  
  private func jsonPath(_ fileName: String) throws -> String {
    guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
      throw JsonDecodingError.failedToFindJSON
    }
    
    return path
  }
  
  private func jsonString<T: Decodable>(_ filePath: String, _ decodeType: T) throws -> String {
    var jsonString = try String(contentsOfFile: filePath)
    if T.self == Catalog.self {
      jsonString = "{ \"catalog\": \(jsonString) }"
    }
    
    return jsonString
  }
  
  // FIXME: - 경고 발생 및 json String에 대해 보다 근본적인 해결이 필요함
  private func jsonData(_ fileString: String) throws -> Data {
    guard let jsonData = try? fileString.data(using: .utf8) else {
      throw JsonDecodingError.failedToConvertJSON
    }
    
    return jsonData
  }
  
  private func jsonDecode<T: Decodable>(_ jsonData: Data, _ decodeType: T) throws -> T {
    guard let decodedData = try? JSONDecoder().decode(T.self, from: jsonData) else {
      throw JsonDecodingError.failedToUnwrapping
    }
    
    return decodedData
  }
}
