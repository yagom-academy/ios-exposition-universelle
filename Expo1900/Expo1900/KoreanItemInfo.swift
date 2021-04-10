//
//  KoreanItemInfo.swift
//  Expo1900
//
//  Created by kio on 2021/04/09.
//

import Foundation

struct KoreanItemInfo: Decodable {
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
