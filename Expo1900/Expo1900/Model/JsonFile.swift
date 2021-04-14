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
    let data = try jsonData(filePath)
    let decodeData = try jsonDecode(data, type)
    
    return decodeData
  }
  
  private func jsonPath(_ fileName: String) throws -> String {
    guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
      throw JsonDecodingError.failedToFindJSON
    }
    
    return path
  }
  
  private func jsonData(_ filePath: String) throws -> Data {
    guard let jsonData = try? String(contentsOfFile: filePath).data(using: .utf8) else {
      throw JsonDecodingError.failedToConvertJSON
    }
    
    return jsonData
  }
  
  // FIXME: - json파일 디코딩 문제
  private func jsonDecode<T: Decodable>(_ jsonData: Data, _ decodeType: T) throws -> T {
    var realJsonData = jsonData
    if T.self == Catalog.self {
      let itemJSONString = String(decoding: jsonData, as: UTF8.self)
      let addArrayName = "{ \"catalog\": \(itemJSONString) }"
      let replaceLineChar = addArrayName.replacingOccurrences(of: "\n", with: " ")
      realJsonData = Data(replaceLineChar.utf8)
    }
    
    guard let decodedData = try? JSONDecoder().decode(T.self, from: realJsonData) else {
      throw JsonDecodingError.failedToUnwrapping
    }
    
    return decodedData
  }
}
