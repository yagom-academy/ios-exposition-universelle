//
//  Int+Extension.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/23.
//

import Foundation

extension Int {
    func convertDecimal() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: self) ?? "0"
    }
}
