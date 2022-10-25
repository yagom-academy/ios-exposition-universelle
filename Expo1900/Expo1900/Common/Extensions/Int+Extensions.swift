//
//  Int+Extensions.swift
//  Expo1900
//
//  Created by jin on 10/25/22.
//

import Foundation

extension Int {
    var formattedWithSeparator: String {
        return Formatter.withDecimalSeparator.string(for: self) ?? ""
    }
}
