//
//  Entry.swift
//  Expo1900
//
//  Created by Jaehun Lee on 3/5/24.
//

struct Entry: Decodable {
    let imageName: String
    let name: String
    let shortDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case imageName = "image_name"
        case name
        case shortDescription = "short_desc"
    }
}
