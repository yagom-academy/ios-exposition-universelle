//
//  ExpoEntry.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/18.
//

struct ExpoEntry: Codable {
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
