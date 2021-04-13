//
//  JSONData.swift
//  Expo1900
//
//  Created by 김찬우 on 2021/04/09.
//

import Foundation

struct HeritageItem: Decodable, Equatable {
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

struct ExpoOfParis: Decodable, Equatable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    let items: [HeritageItem]?
}

