//
//  Entry.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/13.
//

struct Entry: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case desc = "desc"
    }
}
