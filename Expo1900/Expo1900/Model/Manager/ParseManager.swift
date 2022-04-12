//
//  ParseManager.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/11.
//

import UIKit

struct ParseManager<Element: Decodable> {
  static func parse(name: String) -> Element? {
    guard let dataAssert = NSDataAsset(name: name) else {
      return nil
    }
    let jsonData = dataAssert.data
    let decodedData = try? JSONDecoder().decode(Element.self, from: jsonData)
    
    return decodedData
  }
}
