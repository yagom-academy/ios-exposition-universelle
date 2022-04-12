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
  let shortDescription: String
  let description: String
  
  private enum CodingKeys: String, CodingKey {
    case name
    case imageName = "image_name"
    case shortDescription = "short_desc"
    case description = "desc"
  }
}
