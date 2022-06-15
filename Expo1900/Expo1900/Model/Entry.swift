//
//  Item.swift
//  Expo1900
//
//  Created by dhoney96 on 2022/06/13.
//

import Foundation

struct Entry: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let longDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case longDescription = "desc"
    }
}



