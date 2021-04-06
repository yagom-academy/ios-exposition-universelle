//
//  Exposition.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/06.
//

import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: CodingKey {
        case title
        case visitors
        case location
        case duration
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = (try? container.decode(String.self, forKey: .title)) ?? ""
        self.visitors = (try? container.decode(Int.self, forKey: .visitors)) ?? 0
        self.location = (try? container.decode(String.self, forKey: .location)) ?? ""
        self.duration = (try? container.decode(String.self, forKey: .duration)) ?? ""
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
    }
}
