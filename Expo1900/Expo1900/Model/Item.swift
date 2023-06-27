//
//  Item.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/26.
//

struct Item: Decodable {
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
