//
//  ExpositionUniverselleItem.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/20.
//

struct ExpositionUniverselleItem: Decodable {
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case name, desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
}
