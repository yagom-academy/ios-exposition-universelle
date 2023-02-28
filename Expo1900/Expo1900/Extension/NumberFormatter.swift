//  Expo1900 - NumberFormatter.swift
//  created by vetto, goat on 2023/02/28

import Foundation

extension NumberFormatter {
    static func convertToNumber(from int: Int) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        
        guard let number = numberFormatter.string(for: int) else { return "" }
        
        return number
    }
}
