//
//  ExpositionItem.swift
//  Expo1900
//
//  Created by WANKI KIM on 2021/07/06.
//

import Foundation

struct ExpositionItem: Codable {
    private(set) var name: String
    private(set) var imageName: String
    private(set) var shortDescription: String
    private(set) var description: String
    
    private enum CondingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
