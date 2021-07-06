//
//  Entry.swift
//  Expo1900
//
//  Created by 3A on 2021/07/05.
//

import Foundation

struct Entry: Decodable {
    let name: String?
    let imageName: String?
    let shortDescription: String?
    let description: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
