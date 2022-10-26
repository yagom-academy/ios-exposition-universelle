//
//  Exposition.swift
//  Exposition
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.
import Foundation

struct Exposition: Decodable {
    private let originTitle: String
    private let originVisitors: Int
    private let originLocation: String
    private let originDuration: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case originTitle = "title"
        case originVisitors = "visitors"
        case originLocation = "location"
        case originDuration = "duration"
        case description
    }
    
    var title: String {
        return originTitle.replacingOccurrences(of: "(", with: "\n(")
    }
    
    var visitors: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedNumber = formatter.string(for: originVisitors) ?? Constant.zero
        
        return String(format: Constant.visitorsText, formattedNumber)
    }
    
    var location: String {
        return Constant.locationPrefix + originLocation
    }
    
    var duration: String {
        return Constant.durationPrefix + originDuration
    }
}
