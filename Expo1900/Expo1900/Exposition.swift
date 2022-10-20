//
//  Exposition.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/18.
//
import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var visitorsDescription: String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formatted: String = numberFormatter.string(from: NSNumber(value: visitors)) ?? ""
        return "방문객 : " + formatted + " 명"
    }
    
    var locationDescription: String {
        return "개최지 : " + self.location
    }
    
    var durationDescription: String {
        return "개최 기간 : " + self.duration
    }
}
