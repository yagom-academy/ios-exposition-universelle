//
//  Entry.swift
//  Expo1900
//
//  Created by Minsup, Jusbug on 2023/06/26.
//

struct Entry: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let longDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case longDescription = "desc"
    }
}
