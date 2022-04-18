//
//  Int+Extension.swift
//  Expo1900
//
//  Created by Lingo on 2022/04/13.
//

import Foundation

extension Int {
  
  func toDecimal() -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.string(for: self) ?? ""
  }
}
