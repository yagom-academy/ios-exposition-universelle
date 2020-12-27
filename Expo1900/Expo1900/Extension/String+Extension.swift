//
//  String+Extension.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/25.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: UInt) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let doubleValue = Double(value)
        guard let valueWithComma = numberFormatter.string(from: NSNumber(value: doubleValue)) else {
            return
        }
        appendLiteral(valueWithComma)
    }
}
