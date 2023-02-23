//
//  Entry.swift
//  Expo1900
//
//  Created by 혜모리, Andrew on 2023/02/20.
//

struct Entry: Decodable {
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
