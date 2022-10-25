//
//  Exhibition.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/18.
//

struct Exhibition: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
