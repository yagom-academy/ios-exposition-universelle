//
//  ExhibitionWorkInfo.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/08.
//

import UIKit

// Model
struct ExhibitionWorkCell {
  var name: String
  var imageName: String
  var shortDescription: String
  var description: String
  
  var image: UIImage? {
    return UIImage(named: "\(imageName).jpg")
  }
  
  init(name: String,
       imageName: String,
       shortDescription: String,
       description: String) {
    self.name = name
    self.imageName = imageName
    self.shortDescription = shortDescription
    self.description = description
  }
}
