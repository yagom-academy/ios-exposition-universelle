//
//  expositionItems.swift
//  Expo1900
//
//  Created by malrang, cathy on 2022/04/12.
//

import Foundation

struct ExpositionItems: Codable, JsonDecoder {
    let name: String?
    let imageName: String?
    let shortDescription: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
