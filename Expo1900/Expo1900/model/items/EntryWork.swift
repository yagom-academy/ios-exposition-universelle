//
//  CatalogOfExhibits.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/05.
//

import Foundation

struct EntryWork: Decodable {
  var name: String
  var imageName: String
  var shortDesc: String
  var desc: String
  
  private enum CodingKeys: String, CodingKey {
    case name, desc
    case imageName = "image_name"
    case shortDesc = "short_desc"
  }
}
