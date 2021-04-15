//
//  ExhibitionWork.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/05.
//

import UIKit

struct ExhibitionWork: Decodable {
  var name: String
  var imageName: String
  var shortDescription: String
  var description: String
  
  var image: UIImage? {
    return UIImage(named: "\(imageName).jpg")
  }
  
  private enum CodingKeys: String, CodingKey {
    case name
    case imageName = "image_name"
    case shortDescription = "short_desc"
    case description = "desc"
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
