//
//  Items.swift
//  Expo1900
//
//  Created by hyunMac on 10/30/23.
//

struct Items: Decodable {
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
