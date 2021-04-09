//
//  JSONData.swift
//  Expo1900
//
//  Created by 김찬우 on 2021/04/09.
//

import Foundation



struct Item: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
}

struct ExpoOfParis: Decodable {
    let titile: String
    let visitor: Int
    let location: String
    let duration: String
    let description: String
    let item: [Item]?
}

