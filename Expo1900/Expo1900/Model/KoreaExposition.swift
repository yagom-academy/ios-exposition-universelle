//
//  KoreaExposition.swift
//  Expo1900
//
//  Created by 김준건 on 2021/07/06.
//

import Foundation


struct KoreaExposition: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}


//extension KoreaExposition: Decodable {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        name = try values.decode(String.self, forKey: .name)
//        imageName = try values.decode(String.self, forKey: .imageName)
//        shortDescription = try values.decode(String.self, forKey: .shortDescription)
//        description = try values.decode(String.self, forKey: .description)
//    }
//}


