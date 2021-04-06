//
//  ExpoData.swift
//  Expo1900
//
//  Created by james on 2021/04/06.
//

import Foundation

struct Expo {
    var title: String
    var visitors: Int
    var location: String
    var duration: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case visitors = "visitors"
        case location = "location"
        case duration = "duration"
        case description = "description"
    }
}

extension Expo: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        visitors = try values.decode(Int.self, forKey: .visitors)
        location = try values.decode(String.self, forKey: .location)
        duration = try values.decode(String.self, forKey: .duration)
        description = try values.decode(String.self, forKey: .description)
        
    }
}
