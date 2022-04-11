//
//  Item.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/11.
//

import Foundation

struct Item: Codable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
