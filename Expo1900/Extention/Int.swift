//
//  Int.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/16.
//

import Foundation

extension Int {
    func numberFormatterParse() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(from: self as NSNumber) else {
            return ""
        }
        return result
    }
}
