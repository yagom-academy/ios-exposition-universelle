//
//  ExhibitInformation.swift
//  Expo1900
//
//  Created by seunkim on 2021/04/05.
//

import Foundation

struct ExhibitedItem: Decodable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
