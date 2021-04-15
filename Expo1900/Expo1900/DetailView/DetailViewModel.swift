//
//  DetailViewModel.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/08.
//

import Foundation

class DetailViewModel {
  private var info: ExhibitionWork?
  
  func update(model: ExhibitionWork?) {
    info = model
  }
  
  func exhibitionWork() -> ExhibitionWork? {
    guard let exhibitionWorkInfo = info else {
      return nil
    }
    return exhibitionWorkInfo
  }
}
