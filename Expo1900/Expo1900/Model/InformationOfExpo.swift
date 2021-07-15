//
//  Exposition.swift
//  Expo1900
//
//  Created by tae hoon park on 2021/07/06.
//

import Foundation

struct InformationOfExpo: Decodable {
    let title: String
    private let visitors: Int
    let location: String
    let duration: String
    let description: String
}

extension InformationOfExpo {
    var visitorsWithComma: String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: visitors as NSNumber) ?? ""
    }
}
