//
//  Entry.swift
//  Expo1900
//
//  Created by Marco, Soll, Yescoach on 2021/07/05.
//

import Foundation

struct Entry: Codable {
    let name: String?
    let imageName: String?
    let shortDescription: String?
    let description: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try? container.decode(String.self, forKey: .name)
        self.imageName = try? container.decode(String.self, forKey: .imageName)
        self.shortDescription = try? container.decode(String.self, forKey: .shortDescription)
        self.description = try? container.decode(String.self, forKey: .description)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
