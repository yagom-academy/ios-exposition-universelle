//
//  ParisExpoInformation.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/06.
//

import Foundation

struct ParisExpoInformation: Decodable {
    private var title: String
    private let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var formattedTitle: String {
        return title.replacingOccurrences(of: "(", with: "\n(")
    }
    
    var formattedVisitors: String {
        return "\(visitors.decimalString) 명"
    }
}

