//
//  JSONModel.swift
//  Expo1900
//
//  Created by duckbok on 2021/04/09.
//

import Foundation

struct Exposition: Decodable, Equatable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var formattedVisitors: String? {
        get {
            let visitorsCount: NSNumber = visitors as NSNumber
            let formatter = NumberFormatter()
            
            formatter.numberStyle = .decimal
            guard let formatted = formatter.string(from: visitorsCount) else { return nil }
            return formatted + " 명"
        }
    }
    
    var formattedTitle: String? {
        get {
            var elements = title.components(separatedBy: "(")
            var formatted = elements.removeFirst()
            
            formatted = elements.reduce(formatted) { $0 + "\n(" + $1 }

            return formatted
        }
    }
    
    struct Entry: Decodable, Equatable {
        private enum CodingKeys: String, CodingKey {
            case name
            case imageName = "image_name"
            case shortDescription = "short_desc"
            case description = "desc"
        }
        
        let name: String
        let imageName: String
        let shortDescription: String
        let description: String
    }
}
