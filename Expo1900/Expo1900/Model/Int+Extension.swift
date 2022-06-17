//
//  Int+Extension.swift
//  Expo1900
//
//  Created by dhoney96 on 2022/06/17.
//

import Foundation

extension Int {
    func formatNumber() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let number = numberFormatter.string(for: self) else { return "" }
        return number
    }
}
