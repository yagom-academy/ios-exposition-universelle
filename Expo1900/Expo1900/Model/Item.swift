//
//  Item.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/13.
//

import UIKit

struct Item: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    
    static func getItems() throws -> [Item] {
        return try [Item].decode(with: "items")
    }
}
