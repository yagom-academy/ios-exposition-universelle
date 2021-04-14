//
//  DetailViewModel.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/08.
//

import Foundation

class DetailViewModel {
  var exhibitionWorkCell: ExhibitionWorkInfo?
  
  func update(model: ExhibitionWorkInfo?) {
    exhibitionWorkCell = model
  }
}
