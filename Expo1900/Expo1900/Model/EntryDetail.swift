//
//  EntryDetail.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/5/24.
//

struct EntryDetail: Decodable {
    let name: String
    let imageName: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case description = "desc"
    }
}
