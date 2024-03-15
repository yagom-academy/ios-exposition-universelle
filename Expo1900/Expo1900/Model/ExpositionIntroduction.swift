//
//  ExpositionIntroduction.swift
//  Expo1900
//
//  Created by Danny, Gray on 3/4/24.
//

struct ExpositionIntroduction: Equatable, Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case visitors
        case location
        case duration
        case description
    }
    
}
