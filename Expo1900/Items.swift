//
//  Items.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/06.
//

import Foundation

struct Items: Codable {
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
