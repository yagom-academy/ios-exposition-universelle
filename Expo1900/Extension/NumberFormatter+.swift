//
//  FormatManager.swift
//  Expo1900
//
//  Created by Hemg, RedMango on 2023/06/28.
//

import Foundation

extension NumberFormatter {
    static func numberFormatterStyle(_ numberFormatterStyle: NumberFormatter.Style) -> NumberFormatter {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = numberFormatterStyle
        
        return numberFormatter
    }
}
