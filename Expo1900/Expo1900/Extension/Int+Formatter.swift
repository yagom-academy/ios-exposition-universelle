//
//  Int+Formatter.swift
//  Expo1900
//
//  Created by Hyoju Son on 2021/12/08.
//

import Foundation

extension Int {
    var formattedString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: self) ?? "\(self)"
    }
}
