//
//  Exposition.swift
//  Expo1900
//
//  Created by song on 2022/04/11.
//

import UIKit

struct Expo: Decodable {
  let title: String
  let visitors: Int
  let location: String
  let duration: String
  let description: String
  
  static func parse() -> Expo? {
    guard let dataAssert = NSDataAsset(name: "exposition_universelle_1900") else {
      return nil
    }
    let jsonData = dataAssert.data
    let expo = try? JSONDecoder().decode(Expo.self, from: jsonData)
    
    return expo
  }
}
