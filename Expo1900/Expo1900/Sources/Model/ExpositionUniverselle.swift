//
//  ExpositionUniverselle.swift
//  Expo1900
//
//  Created by Christy, Rhode on 2023/02/20.
//

import Foundation

struct ExpositionUniverselle: Decodable {
    var title: String
    var visitorNumber: Int
    var location: String
    var duration: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case visitorNumber = "visitors"
        case location
        case duration
        case description
    }
}
