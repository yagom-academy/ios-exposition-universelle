//
//  Formatter+Extensions.swift
//  Expo1900
//
//  Created by jin on 10/25/22.
//

import Foundation

extension Formatter {
    static let withDecimalSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}
