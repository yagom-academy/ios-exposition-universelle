//
//  Items.swift
//  Expo1900
//
//  Created by 박종화 on 2023/06/26.
//

struct Item: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
