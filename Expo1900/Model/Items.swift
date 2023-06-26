//
//  Items.swift
//  Expo1900
//
//  Created by Hemg, RedMango on 2023/06/26.
//

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
