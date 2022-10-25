//
//  ExpoInformation.swift
//  Created by sunnyCookie, Wonbi
//

import Foundation

struct ExpoInformation: Codable {
    private let title: String
    private let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var mainTitle: String {
        return title.components(separatedBy: "(").joined(separator: "\n(")
    }
    
    var decimalVisitor: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: visitors) ?? ""
    }
}
