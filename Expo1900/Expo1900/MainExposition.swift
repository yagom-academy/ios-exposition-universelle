//
//  ExpositionData.swift
//  Expo1900
//
//  Created by Goat, vetto on 2023/02/20.
//

import Foundation

struct mainExpo: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case visitors
        case location
        case duration
        case description
    }
}
