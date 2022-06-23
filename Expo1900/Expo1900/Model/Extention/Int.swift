//
//  Int.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/16.
//

import Foundation

extension Int {
    func formatted(style: NumberFormatter.Style) -> String {
        let defaultOptionalValue = ""
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = style
        guard let result = numberFormatter.string(from: self as NSNumber) else {
            return defaultOptionalValue
        }
        return result
    }
}
