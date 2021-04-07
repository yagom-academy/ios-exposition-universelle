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
  var shortDescription: String
  var description: String
  
  private enum CodingKeys: String, CodingKey {
    case name, description
    case imageName = "image_name"
    case shortDescription = "short_desc"
  }
}
