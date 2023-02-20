//
//  ParisExpo.swift
//  Expo1900
//
//  Created by Rowan, 리지 on 2023/02/20.
//

struct Items: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name, description
        case imageName = "image_name"
        case shortDescription = "short_desc"
    }
}
