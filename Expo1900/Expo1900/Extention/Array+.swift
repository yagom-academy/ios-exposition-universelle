//
//  Array+.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/17.
//

extension Array {
  subscript(safe index: Int) -> Element? {
    return self.indices ~= index ? self[index] : nil
  }
}
