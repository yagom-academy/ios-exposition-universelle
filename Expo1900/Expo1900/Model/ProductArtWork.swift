//
//  ProductArtWork.swift
//  Expo1900
//
//  Created by 김태현 on 2022/04/11.
//

import Foundation

struct KoreanHistoricalItem: Codable {
    var name: String
    var imageName: String
    var shortDesciption: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesciption = "short_desc"
        case description = "desc"
    }
}
