//
//  JSONModel.swift
//  Expo1900
//
//  Created by duckbok on 2021/04/09.
//

struct Exposition: Decodable, Equatable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    struct Entry: Decodable, Equatable {
        private enum CodingKeys: String, CodingKey {
            case name
            case imageName = "image_name"
            case shortDescription = "short_desc"
            case description = "desc"
        }
        
        let name: String
        let imageName: String
        let shortDescription: String
        let description: String
    }
}
