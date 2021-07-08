//
//  ExpositionItem.swift
//  Expo1900
//
//  Created by WANKI KIM on 2021/07/06.
//

import Foundation

struct ExhibitionItem: Decodable {
    private let name: String
    private let imageName: String
    private let shortDescription: String
    private let description: String
    
    private enum CondingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
