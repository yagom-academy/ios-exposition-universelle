//
//  Item.swift
//  Expo1900
//
//  Created by 잼킹 on 2021/07/05.
//

import Foundation

struct Item: Decodable {
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
