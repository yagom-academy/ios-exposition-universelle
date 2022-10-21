//
//  Exposition.swift
//  Exposition
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.
import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var titleData: String {
        return title.replacingOccurrences(of: "(", with: "\n(")
    }
    
    var visitorsData: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedNumber = formatter.string(for: visitors) ?? "0"
        return "방문객 : \(formattedNumber) 명"
    }
    
    var locationData: String {
        return "개최지 : \(location)"
    }
    
    var durationData: String {
        return "개최기간 : \(duration)"
    }
}
