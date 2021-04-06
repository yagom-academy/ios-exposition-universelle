//
//  ExhibitInformation.swift
//  Expo1900
//
//  Created by seunkim on 2021/04/05.
//

import Foundation

struct ExhibitedItem: Codable {
    var name: String
    var imageName: String
    var shortDescription: String
    var Description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case Description = "desc"
    }
}
