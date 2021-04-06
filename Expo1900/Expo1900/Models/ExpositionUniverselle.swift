//
//  Expo.swift
//  Expo1900
//
//  Created by 기원우 on 2021/04/05.
//

import Foundation

struct ExpositionUniverselle: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case visitors
        case location
        case duration
        case desc = "description"
    }
}

