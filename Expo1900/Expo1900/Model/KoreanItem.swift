//
//  items.swift
//  Expo1900
//
//  Created by Sunny on 2021/04/07.
//

import Foundation

struct KoreanItem : Decodable {
    let koreanTitle : String
    let EnglishTitle : String
    let shortDescription : String
    let fullDescription : String
    
    enum CodingKeys : String, CodingKey {
        case koreanTitle = "name"
        case EnglishTitle = "image_name"
        case shortDescription = "short_desc"
        case fullDescription = "desc"
    }
}

