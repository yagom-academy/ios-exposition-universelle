//
//  Item.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/11.
//

import Foundation

struct Item: Codable {
    private let name: String
    private let imageName: String
    private let shortDescription: String
    private let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
