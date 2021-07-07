//
//  Items.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/06.
//

import Foundation

struct InformationOfKoreanHeritage: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
