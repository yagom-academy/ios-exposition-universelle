//
//  Int+Extensions.swift
//  Expo1900
//
//  Created by Baek on 2022/06/17.
//

import Foundation

extension Int {
    func setNumberFormatter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
