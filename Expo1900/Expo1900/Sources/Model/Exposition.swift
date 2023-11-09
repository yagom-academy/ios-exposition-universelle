//
//  Exposition.swift
//  Expo1900
//
//  Created by uemu, morgan on 10/30/23.
//

enum Exposition { }

extension Exposition {
    struct EntryItem: Decodable {
        let name: String
        let imageName: String
        let shortDesc: String
        let description: String
        
        private enum CodingKeys: String, CodingKey {
            case name
            case imageName = "image_name"
            case shortDesc = "short_desc"
            case description = "desc"
        }
    }
}

extension Exposition {
    struct ExpositionInfo: Decodable {
        let title: String
        let visitors: Int
        let location: String
        let duration: String
        let description: String
    }
}
