//
//  KoreanHeritage.swift
//  Expo1900
//
//  Created by Danny, Gray on 3/4/24.
//

struct KoreanHeritageDetail: Equatable, Codable {
    let name: String
    let imageName: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case description = "desc"
    }
}
