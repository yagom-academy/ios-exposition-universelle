//  NumberFormatter+Extension.swift
//  Expo1900
//  Created by inho, LJ on 2022/10/25.

import Foundation

extension NumberFormatter {
    static let decimalFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }()
}
