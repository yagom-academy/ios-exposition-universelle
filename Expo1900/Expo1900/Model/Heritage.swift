//
//  Heritage.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/11.
//

import UIKit

struct Heritage: Codable {
  let name: String
  let imageName: String
  let shortDescription: String
  let description: String
  
  enum CodingKeys: String, CodingKey {
    case name
    case imageName = "image_name"
    case shortDescription = "short_desc"
    case description = "desc"
  }
  
  static func parse() -> [Heritage]? {
    guard let dataAssert = NSDataAsset(name: "items") else {
      return nil
    }
    let jsonData = dataAssert.data
    let heritages = try? JSONDecoder().decode([Heritage].self, from: jsonData)
    
    return heritages
  }
}
