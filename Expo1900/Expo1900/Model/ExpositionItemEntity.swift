//
//  ExpositionItemEntity.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/27.
//

struct ExpositionItemEntity: Decodable, Equatable {
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
