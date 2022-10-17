//
//  Items.swift
//  Expo1900
//
//  Created by baem,woong on 2022/10/17.
//

struct Items: Codable {
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
