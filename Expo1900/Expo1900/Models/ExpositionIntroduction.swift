//
//  ExpositionIntroduction.swift
//  Expo1900
//
//  Created by tottalE, Kyo on 10/17/22.
//
import Foundation

struct ExpositionIntroduction: Decodable {
    let title: String
    let visitorNumber: Int
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title, location, duration, description
        case visitorNumber = "visitors"
    }
    
    var visitorNumberDescription: String {
        return String(format: "방문객 : %@ 명", self.visitorNumber.formattedWithSeparator)
    }
    var locationDescription: String {
        return String(format: "개최지 : %@", self.location)
    }
    var durationDescription: String {
        return String(format: "개최 기간 : %@", self.duration)
    }
}
