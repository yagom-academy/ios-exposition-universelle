//
//  ExpositionUniverselle.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/26.
//

import Foundation

struct ExpositionUniverselle: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let totalDescription: String
    
    var titleForLabel: String {
        return title.replacingOccurrences(of: "(", with: "\n(")
    }
    
    var visitorsForLabel: String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let formattedVisitorsNumber = numberFormatter.string(from: NSNumber(value: visitors)) else {
            return "방문객 : 0 명"
        }
        
        return "방문객 : \(formattedVisitorsNumber) 명"
    }
    
    var locationForLabel: String {
        return "개최지 : \(location)"
    }
    
    var durationForLabel: String {
        return "개최기간 : \(duration)"
    }
    
    enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration
        case totalDescription = "description"
    }
}
