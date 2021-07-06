//
//  ExpositionItem.swift
//  Expo1900
//
//  Created by Terry Lee on 2021/07/06.
//

import Foundation

struct ExpositionItem: Decodable {
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
