//
//  Item.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/26.
//

struct Item: Codable {
    var name: String
    var imageName: String
    var shortDesc: String
    var desc: String
    
    enum CodingKeys: String, CodingKey {
        case name, desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
}
