//
//  Entry.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/13.
//

import Foundation

struct EntryEntity: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
}

extension EntryEntity {
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description
    }
}
