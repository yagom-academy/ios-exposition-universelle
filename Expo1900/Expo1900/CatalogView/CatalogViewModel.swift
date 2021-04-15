//
//  CatalogViewModel.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/08.
//

import Foundation

class CatalogViewModel {
  private var exhibitionWorkCatalog: [ExhibitionWork] = []
  
  init() {
    let jsonFile = JsonFile(fileName: "items")
    do {
      exhibitionWorkCatalog = try jsonFile.decode(type: [ExhibitionWork]())
    } catch {
      print(error)
    }
  }
  
  var numOfExhibitionWorkCatalog: Int {
    return exhibitionWorkCatalog.count
  }
  
  func exhibitionWorkInfo(at index: Int) -> ExhibitionWork {
    return exhibitionWorkCatalog[index]
  }
}
