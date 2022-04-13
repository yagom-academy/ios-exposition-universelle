//
//  Model.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/11.
//

struct Item: Codable {
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
}

struct Exposition: Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}
