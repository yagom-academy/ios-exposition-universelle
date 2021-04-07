//
//  EntryItemData.swift
//  Expo1900
//
//  Created by 황인우 on 2021/04/06.
//

import Foundation
struct Item {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case imageName = "image_name"
        case name
        case shortDescription = "short_desc"
        case description = "desc"
    }
}

extension Item: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imageName = try container.decode(String.self, forKey: .imageName)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        shortDescription = try container.decode(String.self, forKey: .shortDescription)
    }
}
