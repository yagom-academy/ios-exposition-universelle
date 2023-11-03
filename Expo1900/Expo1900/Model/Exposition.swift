//
//  exposition.swift
//  Expo1900
//
//  Created by Hisop on 2023/10/31.
//

import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let explanation: String
    
    var formattingTitle: String {
        guard let index = title.firstIndex(of: "(") else {
            return title
        }
        
        return "\(title.prefix(upTo: index))\n\(title.suffix(from: index))"
    }
    
    var formattingVisitors: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let formattingNumber = numberFormatter.string(for: visitors) else {
            return String(visitors)
        }
        
        return "방문객 : " + formattingNumber + " 명"
    }
    
    var formattingLocation: String {
        return "개최지 : " + location
    }
    
    enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration
        case explanation = "description"
    }
}
