//
//  InternationalExposition.swift
//  Expo1900
//
//  Created by karen on 2023/06/27.
//

struct InternationalExposition: Decodable {
    let title: String
    let visitors: UInt
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        visitors = try container.decodeIfPresent(UInt.self, forKey: .visitors) ?? 0
        location = try container.decode(String.self, forKey: .location)
        duration = try container.decode(String.self, forKey: .duration)
        description = try container.decode(String.self, forKey: .description)
    }
}
