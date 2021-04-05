//
//  Items.swift
//  Expo1900
//
//  Created by 기원우 on 2021/04/05.
//

import Foundation

struct Item: Codable {
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case desc
    }
}
