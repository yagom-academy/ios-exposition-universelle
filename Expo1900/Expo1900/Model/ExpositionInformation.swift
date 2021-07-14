//
//  Exposition.swift
//  Expo1900
//
//  Created by WANKI KIM on 2021/07/06.
//

import Foundation

struct ExpositionInformation: Decodable {
    let title: String
    let visitors: UInt
    let location: String
    let duration: String
    let description: String
    
    var formattedTitle: String? {
        if let findIndex: String.Index = title.firstIndex(of: "(") {
            return title[..<findIndex] + "\n" + title[findIndex...]
        }
        return nil
    }
    
    var formattedVisitors: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return "\(formatter.string(from: NSNumber(value: visitors)) ?? "")명"
    }
}
