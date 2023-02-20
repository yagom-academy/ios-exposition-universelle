//
//  Items.swift
//  Expo1900
//
//  Created by kimseongjun on 2023/02/20.
//

import Foundation

struct Items: Codable {
    var name: String
    var imageName: String
    var shortDescrition: String
    var description: String
    
    enum CondingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
