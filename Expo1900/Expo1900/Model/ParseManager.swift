//
//  ParseManager.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/11.
//

import UIKit

struct ParseManager<T: Decodable> {
  static func parse(name: String) -> T? {
    guard let dataAssert = NSDataAsset(name: name) else {
      return nil
    }
    let jsonData = dataAssert.data
    let heritages = try? JSONDecoder().decode(T.self, from: jsonData)
    
    return heritages
  }
}
