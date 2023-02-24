//
//  ExpositionUniverselle.swift
//  Expo1900
//
//  Created by Christy, Rhode on 2023/02/20.
//

import Foundation

struct ExpositionUniverselle: Decodable {
    let title: String
    let visitorNumber: Int
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case visitorNumber = "visitors"
        case location
        case duration
        case description
    }
}
