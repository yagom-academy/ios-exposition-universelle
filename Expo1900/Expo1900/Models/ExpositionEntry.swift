//
//  ExpositionEntry.swift
//  Expo1900
//
//  Created by Gordon Choi on 2022/06/14.
//

struct ExpositionEntry: Decodable {
    let name: String
    let imageAddress: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageAddress = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
