//
//  Items.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/05.
//

import Foundation

struct KoreanItem: Decodable {
    var name: String = DefaultJSONValues.text
    var imageName: String = DefaultJSONValues.text
    var shortDescription: String = DefaultJSONValues.text
    var description: String = DefaultJSONValues.text

    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
