//
//  Item.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/06.
//

import Foundation

struct Item: Decodable {
    let name: String
    let imageName: String
    let shortDesc: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case description = "desc"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        self.imageName = (try? container.decode(String.self, forKey: .imageName)) ?? ""
        self.shortDesc = (try? container.decode(String.self, forKey: .shortDesc)) ?? ""
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
    }
}
