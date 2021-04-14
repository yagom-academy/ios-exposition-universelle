//
//  Items.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/05.
//

import Foundation

struct KoreanItem: Decodable {
    var name: String = DefaultValues.text
    var imageName: String = DefaultValues.text
    var shortDescription: String = DefaultValues.text
    var description: String = DefaultValues.text

    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
