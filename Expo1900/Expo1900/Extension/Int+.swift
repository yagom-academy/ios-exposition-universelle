//
//  Int+.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/29.
//

import Foundation

extension Int {
    func changeToDecimalStyle() -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        
        guard let decimalStyleNumber = numberFormatter.string(from: self as NSNumber) else {
            return ""
        }
        
        return decimalStyleNumber
    }
}
