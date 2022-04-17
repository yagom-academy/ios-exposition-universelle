//
//  Decodable+.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/17.
//

import UIKit

enum MyError: Error {
  case invalidName
  case decodeFail
}

extension Decodable {
  static func parse(name: String, completion: (Result<Self, MyError>) -> Void) {
    guard let data = NSDataAsset(name: name)?.data else {
      completion(.failure(MyError.invalidName))
      return
    }
    
    do {
      let decodedData = try JSONDecoder().decode(Self.self, from: data)
      completion(.success(decodedData))
    } catch {
      completion(.failure(MyError.decodeFail))
    }
  }
}
