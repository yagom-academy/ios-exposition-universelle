//
//  ExpositionUniverselle.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/06.
//

import Foundation

class ExpositionUniverselle {
  private let expositionUniverselle: Exposition
  
  init() throws {
    guard let path = Bundle.main.path(forResource: "exposition_universelle_1900", ofType: "json") else {
      throw jsonDecodingError.canNotFindJSONPath
    }
    guard let jsonData = try? String(contentsOfFile: path).data(using: .utf8) else {
      throw jsonDecodingError.failedToConvertJSONAsDataFormat
    }
    guard let unwrappedExplanation = try? JSONDecoder().decode(Exposition.self, from: jsonData) else {
      throw jsonDecodingError.nilHasOccurredWhileUnwrappingData
    }

    self.expositionUniverselle = unwrappedExplanation
//    let replaceLineChar = explanationJSONString.replacingOccurrences(of: "\n", with: " ")
//    let jsonData = Data(replaceLineChar.utf8)
//    self.expositionUniverselle = try! JSONDecoder().decode(Explanation.self, from: jsonData)
  }
  
  func show() {
    print ("""
    -----
    제목: \(expositionUniverselle.title)
    방문수: \(expositionUniverselle.visitors)
    위치: \(expositionUniverselle.location)
    기간: \(expositionUniverselle.duration)
    상세: \(expositionUniverselle.description)
    -----
    """)
  }
}
