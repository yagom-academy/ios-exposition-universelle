//
//  Expo1900.swift
//  Expo1900
//
//  Created by 김태형 on 2020/12/21.
//

import Foundation

struct ExpositionParis: Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

struct EntryOfKorea: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description = "desc"
        case shortDescription = "short_desc"
        case imageName = "image_name"
    }
}

