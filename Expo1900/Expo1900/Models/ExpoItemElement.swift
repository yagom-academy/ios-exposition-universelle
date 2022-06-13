//
//  ExpoItemElement.swift
//  Expo1900
//
//  Created by 변재은 on 2022/06/13.
//

import Foundation

// MARK: - ExpoItemElement
struct ExpoItemElement: Codable {
    let name, imageName, shortDesc, desc: String

    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case desc
    }
}

typealias ExpoItem = [ExpoItemElement]
