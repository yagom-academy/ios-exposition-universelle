//
//  ExpositionIntroduction.swift
//  Expo1900
//
//  Created by tottalE, Kyo on 10/17/22.
//

struct ExpositionIntroduction: Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var visitorsDescription: String {
        return "방문객 : \(self.visitors) 명"
    }
    var locationDescription: String {
        return "개최지 : \(self.location)"
    }
    var durationDescription: String {
        return "개최 기간 : \(self.duration)"
    }
}
