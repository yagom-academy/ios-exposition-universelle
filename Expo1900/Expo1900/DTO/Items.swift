//
//  Items.swift
//  Expo1900
//
//  Created by Hyungmin Lee on 2023/06/26.
//

struct Items: Decodable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
