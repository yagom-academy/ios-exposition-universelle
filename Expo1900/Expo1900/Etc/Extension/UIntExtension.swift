//
//  UIntExtension.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/21.
//

import Foundation

extension UInt {
    func convertToDecimal() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: self) ?? "0"
    }
}
