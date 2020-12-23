//
//  ParisExpositionInformation.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/21.
//

import Foundation

struct ParisExpositionInformation: Codable {
    let title: String
    let visitors: UInt
    let location: String
    let duration: String
    let description: String
    var visitorsWithComma: String {
        return addComma(number: visitors)
    }
    
    private func addComma(number: UInt) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        
        let newValue = numberFormatter.string(from: NSNumber(value: number)) ?? String(number)
        return newValue
    }
}
