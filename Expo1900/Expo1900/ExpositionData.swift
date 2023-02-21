//  Expo1900 - ExpositionData.swift
//  created by Goat, vetto on 2023/02/20

import Foundation

struct ExpositionData: Decodable {
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
