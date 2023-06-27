//
//  Item.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/26.
//

struct Item: Codable {
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
