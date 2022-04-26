//
//  Item.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/13.
//

import UIKit

struct Heritage: Decodable, Item {
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
    
    static func getItems() throws -> [Self] {
        return try [Self].decode(with: "items")
    }
}

protocol Item {
    var name: String { get }
    var imageName: String { get }
    var shortDescription: String { get }
    var description: String { get }
    
    static func getItems() throws -> [Self]
}
