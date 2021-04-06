//
//  EntryItemData.swift
//  Expo1900
//
//  Created by 황인우 on 2021/04/06.
//

import Foundation
struct Item {
    var image: String
    var name: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case image
        case name
        case description
    }
}

extension Item: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image = try values.decode(String.self, forKey: .image)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        
    }
}
