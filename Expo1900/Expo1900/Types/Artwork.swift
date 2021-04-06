//
//  Artwork.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/05.
//

import Foundation

struct Artwork: Decodable {
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
