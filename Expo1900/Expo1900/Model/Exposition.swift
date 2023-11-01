//
//  Exposition.swift
//  Expo1900
//
//  Created by jyubong, mireu
//

import Foundation

struct Exposition: Decodable {
    let title, location, duration, description: String
    let visitorsCount: Int
    
    var visitorsDescription: String {
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            return formatter
        }()
        
        guard let visitors = formatter.string(for: visitorsCount) else { return "\(visitorsCount) 명" }
        
        return "\(visitors) 명"
    }
    
    private enum CodingKeys: String, CodingKey {
        case title, location, duration, description
        case visitorsCount = "visitors"
    }
}
