//
//  ExpoItem.swift
//  Expo1900
//
//  Created by 조민호 on 2022/04/11.
//

import Foundation

struct ExpoItem: Codable {
  let name: String
  let imageName: String
  let shortDesc: String
  let desc: String
  
  private enum CodingKeys: String, CodingKey {
    case name
    case imageName = "image_name"
    case shortDesc = "short_desc"
    case desc
  }
}
