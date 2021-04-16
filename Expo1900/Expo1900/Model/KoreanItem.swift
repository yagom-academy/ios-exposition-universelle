//
//  Entry.swift
//  Expo1900
//
//  Created by Yunhwa on 2021/04/08.
//

import Foundation

struct KoreanItem: Decodable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case Description = "desc"
    }
   
}
