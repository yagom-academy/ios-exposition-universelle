//
//  ExhibitionItem.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/26.
//

struct ExhibitionItem: Decodable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
