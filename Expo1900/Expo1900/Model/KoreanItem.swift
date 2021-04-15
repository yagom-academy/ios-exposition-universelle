//
//  Items.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/05.
//

import Foundation

struct KoreanItem: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String

    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
