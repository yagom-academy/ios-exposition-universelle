//
//  Expo.swift
//  Expo1900
//
//  Created by 사파리, papri on 2022/04/12.
//

import Foundation

struct Expo: Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var formattedVisitors: String {
        visitors.changedFormat() + " 명"
    }
}

private extension Int {
    func changedFormat() -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
    
        return numberFormatter.string(from: self as NSNumber) ?? "FormatError"
    }
}
