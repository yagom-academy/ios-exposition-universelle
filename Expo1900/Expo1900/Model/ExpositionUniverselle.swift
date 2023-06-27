//
//  ExpositionUniverselle.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/27.
//

import Foundation

struct ExpositionUniverselle: Decodable {
    let title: String
    let visitors: UInt
    let location: String
    let duration: String
    let description: String
    
    var formattedVisitors: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let result = numberFormatter.string(for: visitors) else {
            return String(visitors)
        }
        
        return result
    }
}
