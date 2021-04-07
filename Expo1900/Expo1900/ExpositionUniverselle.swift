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
    let jsonFile = JsonFile(fileName: "exposition_universelle_1900")
    self.expositionUniverselle = try jsonFile.decode(type: Exposition())
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
