//
//  ExpositionUniverselle.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/20.
//

struct ExpositionUniverselle: Decodable {
    let title: String
    let visitors: UInt
    let location: String
    let duration: String
    let description: String
    
    var displayedVisitors: String {
        return "방문객 : \(self.visitors.convertToDecimal()) 명"
    }
    var displayedLocation: String {
        return "개최지 : " + self.location
    }
    var displayedDuration: String {
        return "개최 기간: " + self.duration
    }
}
