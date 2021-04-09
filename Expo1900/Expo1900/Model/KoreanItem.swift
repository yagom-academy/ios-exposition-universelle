//
//  items.swift
//  Expo1900
//
//  Created by Sunny on 2021/04/07.
//

import Foundation

struct KoreanItem : Decodable {
    let koreanTitle : String
    let englishTitle : String
    let shortDescription : String
    let fullDescription : String
    
    enum CodingKeys : String, CodingKey {
        case koreanTitle = "name"
        case englishTitle = "image_name"
        case shortDescription = "short_desc"
        case fullDescription = "desc"
    }
}

