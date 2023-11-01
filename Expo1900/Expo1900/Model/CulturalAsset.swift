//
//  items.swift
//  Expo1900
//
//  Created by Hisop on 2023/10/30.
//

struct CulturalAsset: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let detailDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case detailDescription = "desc"
    }
}
