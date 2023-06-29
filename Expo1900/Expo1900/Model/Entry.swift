//
//  Entry.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/26.
//

struct Entry: Decodable {
    let name: String?
    let imageName: String?
    let shortDescription: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
        
        case name
        
    }
    
    init(name: String? = nil, imageName: String? = nil, shortDescription: String? = nil, description: String? = nil) {
        self.name = name
        self.imageName = imageName
        self.shortDescription = shortDescription
        self.description = description
    }
}
