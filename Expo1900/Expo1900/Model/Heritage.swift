//
//  Heritage.swift
//  Expo1900
//
//  Created by 사파리, papri on 12/04/2022.
//

import Foundation

struct Heritage: Codable {
    let title: String
    let imageName: String
    let shortDescription: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case title = "name"
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}

