//
//  ExhibitionList.swift
//  Expo1900
//
//  Created by Danny, Gray on 2024/03/04.
//

struct KoreanHeritage: Equatable, Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
    }
}
