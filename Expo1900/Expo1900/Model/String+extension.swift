//
//  String+extension.swift
//  Expo1900
//
//  Created by 혜모리, Andrew on 2023/02/23.
//

import Foundation

extension String {
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }
    
    func applyFormatter() -> String {
        guard let value = numberFormatter.string(for: Int(self)) else {
            return "0"
        }
        return value
    }
}
