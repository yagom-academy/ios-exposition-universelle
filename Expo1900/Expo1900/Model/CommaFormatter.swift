//
//  CommaFormatter.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/03.
//

import Foundation

enum CommaFormatter {
    static let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        return numberFormatter
    }()
    
    static func formatNumberWithComma(_ number: Int) -> String {
        return numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
}
