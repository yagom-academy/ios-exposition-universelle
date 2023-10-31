//
//  Item.swift
//  Expo1900
//
//  Created by jyubong, mireu
//

import Foundation

struct Item: Decodable {
    let name, imageName, shortDescription, description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
