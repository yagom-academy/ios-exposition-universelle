//
//  KoreaItem.swift
//  Expo1900
//
//  Created by tottalE, Kyo on 10/17/22.
//

struct KoreaItem: Codable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    enum CondingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
