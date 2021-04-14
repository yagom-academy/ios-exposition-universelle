//
//  DetailViewModel.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/08.
//

import Foundation

class DetailViewModel {
  private var info: ExhibitionWorkInfo?
  
  func update(model: ExhibitionWorkInfo?) {
    info = model
  }
  
  func exhibitionWorkInfo() -> ExhibitionWorkInfo? {
    guard let exhibitionWorkInfo = info else {
      return nil
    }
    return exhibitionWorkInfo
  }
}
