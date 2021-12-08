//
//  NumberFormatter+Extension.swift
//  Expo1900
//
//  Created by 이승재 on 2021/12/08.
//

import Foundation

extension NumberFormatter {
    static let decimal: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}
