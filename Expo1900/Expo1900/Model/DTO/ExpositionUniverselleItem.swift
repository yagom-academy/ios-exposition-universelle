//  Expo1900 - ExpositionUniverselleItem.swift
//  Created by Ayaan, Bella on 2022/10/17.
//  Copyright © yagom academy. All rights reserved.

struct ExpositionUniverselleItem: Decodable {
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
