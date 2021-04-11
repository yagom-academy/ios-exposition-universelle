//
//  ExhibitOfKorea.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/07.
//

import Foundation

struct ExhibitItem: Decodable {
    var name: String
    var imageName: String
    var shortDescriptions: String
    var descriptions: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescriptions = "short_desc"
        case descriptions = "desc"
    }
}
