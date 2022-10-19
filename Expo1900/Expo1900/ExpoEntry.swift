//
//  ExpoEntry.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/18.
//

struct ExpoEntry: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
