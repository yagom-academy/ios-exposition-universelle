//
//  ExpositionPostEntity.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/13.
//

import Foundation
struct ExpositionPostEntity: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String  
    let description: String
}
private extension Int {
    func setNumberFormatter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
