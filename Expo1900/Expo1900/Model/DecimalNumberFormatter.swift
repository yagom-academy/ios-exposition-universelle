//
//  NumberFormatterOfVisitor.swift
//  Expo1900
//
//  Created by hy on 2022/10/27.
//

import Foundation

class DecimalNumberFormatter: NumberFormatter {
    override init() {
        super.init()
        self.numberStyle = .decimal
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func formattedNumber(_ number: Int) -> String? {
        return self.string(from: NSNumber(value: number))
    }
}
