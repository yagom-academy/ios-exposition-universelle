//
//  Entry.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/26.
//

struct Entry: Decodable {
    let name: String
    let image: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case image = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
