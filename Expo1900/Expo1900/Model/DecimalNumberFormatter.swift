//  Expo1900 - NumberFormatterOfVisitor.swift
//  Created by Ayaan, Bella on 2022/10/27.
//  Copyright © yagom academy. All rights reserved.

import Foundation

final class DecimalNumberFormatter: NumberFormatter {
    override init() {
        super.init()
        
        self.numberStyle = .decimal
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func formattedNumber(_ number: String) -> String? {
        guard let number = Int(number) else {
            return nil
        }
        return self.string(from: NSNumber(value: number))
    }
}
