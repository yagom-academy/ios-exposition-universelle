//
//  Entry.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/26.
//

struct Entry: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case imageName = "image_name"
        case shortDescription = "short_desc"
        
        case name
        case description
    }
}
