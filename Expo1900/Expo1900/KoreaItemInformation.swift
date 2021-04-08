//
//  KoreaItemInformation.swift
//  Expo1900
//
//  Created by 김태영 on 2021/04/08.
//

import Foundation


struct KoreaItemInformation: Codable {
    
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

