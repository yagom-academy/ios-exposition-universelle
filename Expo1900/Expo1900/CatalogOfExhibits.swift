//
//  CatalogOfExhibits.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/05.
//

import Foundation

class CatalogOfExhibits {
  private let catalogOfExhibits: Catalog
  
  init() throws {
    guard let path = Bundle.main.path(forResource: "Catalog", ofType: "json") else {
      throw jsonDecodingError.canNotFindJSONPath
    }
    guard let jsonData = try? String(contentsOfFile: path).data(using: .utf8) else {
      throw jsonDecodingError.failedToConvertJSONAsDataFormat
    }
    guard let unwrappedCatalog = try? JSONDecoder().decode(Catalog.self, from: jsonData) else {
      throw jsonDecodingError.nilHasOccurredWhileUnwrappingData
    }

    self.catalogOfExhibits = unwrappedCatalog

//    command-line 테스트용 코드
//    let addArrayName = "{ \"catalog\": \(itemJSONString) }"
//    let replaceLineChar = addArrayName.replacingOccurrences(of: "\n", with: " ")
//    let jsonData = Data(replaceLineChar.utf8)
//    self.catalogOfExhibits = try! JSONDecoder().decode(Catalog.self, from: jsonData)
  }
  
  func showSummary() -> [ExhibitionWork] {
    return catalogOfExhibits.catalog
  }
  
  func showDetails(name: String) -> ExhibitionWork? {
    let entryWork: ExhibitionWork
    
    for catalog in catalogOfExhibits.catalog {
      if catalog.name == name {
        entryWork = catalog
        return entryWork
      }
    }
    
    return nil
  }
}
