//
//  Heritage.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/11.
//

struct Heritage: Decodable {
  let name: String?
  let imageName: String?
  let shortDescription: String?
  let description: String?
  
  enum CodingKeys: String, CodingKey {
    case name
    case imageName = "image_name"
    case shortDescription = "short_desc"
    case description = "desc"
  }
}
