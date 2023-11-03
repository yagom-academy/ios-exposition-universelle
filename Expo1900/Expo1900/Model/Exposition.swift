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
        
        guard let visitors = formatter.string(for: visitorsCount) else { return "방문자 : \(visitorsCount) 명" }
        
        return "방문객 : \(visitors) 명"
    }
    
    var locationDescription: String {
        return "개최지 : \(location)"
    }
    
    var durationDescription: String {
        return "개최 기간 : \(duration)"
    }
    
    private enum CodingKeys: String, CodingKey {
        case title, location, duration, description
        case visitorsCount = "visitors"
    }
}
