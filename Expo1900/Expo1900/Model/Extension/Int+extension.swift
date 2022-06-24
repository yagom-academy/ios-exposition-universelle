//
//  Int+extension.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/16.
//

import Foundation

extension Int {
    func formatDecimalNumber() -> String? {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        
        guard let formattedResult = numberformatter.string(from: self as NSNumber) else { return nil }
        return formattedResult
    }
}
