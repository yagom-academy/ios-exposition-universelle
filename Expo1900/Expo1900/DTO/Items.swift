//
//  Items.swift
//  Expo1900
//
//  Created by Zion, Serena Lee on 2023/06/26.
//

struct Item: Decodable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
