//
//  Artwork.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/05.
//

struct Artwork: Decodable, Equatable {
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
