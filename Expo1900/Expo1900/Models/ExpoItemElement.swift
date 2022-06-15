//
//  ExpoItemElement.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/13.
//

import Foundation

// MARK: - ExpoItemElement
struct ExpoItemElement: Codable {
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String

    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case desc
    }
}
