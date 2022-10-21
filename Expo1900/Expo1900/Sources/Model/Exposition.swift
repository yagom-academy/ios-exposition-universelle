//
//  Exposition.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/18.
//

import Foundation
import UIKit

struct Exposition: Codable {
    private let titleOfJsonData: String
    private let visitorsOfJsonData: Int
    private let locationOfJsonData: String
    private let durationOfJsonData: String
    let description: String
    
    var title: String {
        var title: String = titleOfJsonData
        let secondLine: String
        guard let firstLine = title.split(separator: "(").first else {
            return title
        }
        
        title.removeFirst(firstLine.count)
        secondLine = title
        
        return firstLine + "\n" + secondLine
    }
    
    var numberOfVisitors: String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let visitors = numberFormatter.string(from: NSNumber(value: visitorsOfJsonData)) else {
            return String(visitorsOfJsonData)
        }
        
        return "방문객 : \(visitors) 명"
    }
    
    var location: String {
        return "개최지 : \(locationOfJsonData)"
    }
    
    var duration: String {
        return "개최 기간 : \(durationOfJsonData)"
    }
    
    enum CodingKeys: String, CodingKey {
        case titleOfJsonData = "title"
        case visitorsOfJsonData = "visitors"
        case locationOfJsonData = "location"
        case durationOfJsonData = "duration"
        case description
    }
}

