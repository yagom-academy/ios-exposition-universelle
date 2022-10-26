//
//  KoreaItem.swift
//  Expo1900
//
//  Created by tottalE, Kyo on 10/17/22.
//

struct KoreaItem: Decodable {
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
