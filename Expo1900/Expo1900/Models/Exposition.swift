//
//  Exposition.swift
//  Expo1900
//
//  Created by 임성민 on 2020/12/22.
//

import Foundation

struct Exposition: Decodable {
    let title: String
    let visitorsNumber: UInt
    let location: String
    let duration: String
    let description: String
    
    var koreanTitle: String {
        guard let startParenthesesIndex = title.firstIndex(of: "(") else {
            return title
        }
        let koreanTitle = String(title[..<startParenthesesIndex])
        return koreanTitle
    }
    
    var englishTitle: String {
        guard let startParenthesesIndex = title.firstIndex(of: "(") else {
            return title
        }
        let englishTitle = String(title[startParenthesesIndex...])
        return englishTitle
    }
    
    var visitorsNumberWithComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let visitorsNumberWithComma = numberFormatter.string(from: NSNumber(value: visitorsNumber)) else {
            return String(visitorsNumber)
        }
        return visitorsNumberWithComma
    }
    
    enum CodingKeys: String, CodingKey {
        case title, location, duration, description
        case visitorsNumber = "visitors"
    }
}
