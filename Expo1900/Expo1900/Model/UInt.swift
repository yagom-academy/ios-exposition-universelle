//
//  UInt.swift
//  Expo1900
//
//  Created by karen on 2023/07/04.
//

import Foundation

extension UInt {
    func formatToDecimal() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let result = numberFormatter.string(for: self) else {
            return String(self)
        }
        
        return result
    }
}

