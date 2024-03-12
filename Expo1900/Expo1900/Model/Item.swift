//
//  Entry.swift
//  Expo1900
//
//  Created by gama, hamzzi on 3/4/24.
//

struct Item: Codable {
    let name: String
    let summary: String
    let description: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case summary = "short_desc"
        case description = "desc"
        case imageUrl = "image_name"
    }
}
