//
//  Expo1900 - ExhibitItem.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct ExhibitItem: Decodable {
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
