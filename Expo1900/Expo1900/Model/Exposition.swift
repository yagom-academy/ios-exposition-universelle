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
        let formattedNumber = formatter.string(for: visitors) ?? Constant.zero
        return Constant.visitorsPrefix + formattedNumber + Constant.visitorsUnit
    }
    
    var locationData: String {
        return Constant.locationPrefix + location
    }
    
    var durationData: String {
        return Constant.durationPrefix + duration
    }
}
