//
//  ExpoItem.swift
//  Expo1900
//
//  Created by 이성노 on 2021/04/08.
//

import Foundation

struct ExpoItem: Decodable {
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case name, desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
}
