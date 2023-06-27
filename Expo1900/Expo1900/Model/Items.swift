//
//  Items.swift
//  Expo1900
//
//  Created by karen on 2023/06/27.
//

struct Items: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description = "desc"
        case imageName = "image_name"
        case shortDescription = "short_desc"
    }
}
