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
    let jsonFile = JsonFile(fileName: "Catalog")
    self.catalogOfExhibits = try jsonFile.decode(type: Catalog())
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
