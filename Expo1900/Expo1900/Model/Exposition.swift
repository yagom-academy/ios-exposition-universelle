//
//  Exposition.swift
//  Expo1900
//
//  Created by jyubong, mireu
//

import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var visitorsDescription: String {
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            return formatter
        }()
        
        guard let visitors = formatter.string(for: visitors) else { return "\(visitors) 명" }
        
        return "\(visitors) 명"
    }
}
