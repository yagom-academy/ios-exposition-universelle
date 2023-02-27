//
//  ExpositionUniverselleItem.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/20.
//

struct ExpositionUniverselleItem: Decodable {
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
