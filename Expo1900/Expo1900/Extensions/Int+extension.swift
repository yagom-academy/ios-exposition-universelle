//
//  Int+extension.swift
//  Expo1900
//
//  Created by 예거 on 2021/12/10.
//

import Foundation

extension Int {
    var decimalString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: self) ?? "\(self)"
    }
}
