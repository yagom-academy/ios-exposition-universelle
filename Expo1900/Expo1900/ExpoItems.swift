//
//  ExpoItems.swift
//  Expo1900
//
//  Created by 김민성 on 2021/04/12.
//

import Foundation

struct ExpositionItems: Decodable {
    var name: String
    var imageName: String
    var shortDesc: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case description = "desc"
    }
}

