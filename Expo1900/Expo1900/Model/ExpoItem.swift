//
//  ExpoItem.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/06.
//

import Foundation

struct ExpoItem: Codable {
    let name: String
    let imageName: String
    let shortDesc: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case description = "desc"
    }
}
