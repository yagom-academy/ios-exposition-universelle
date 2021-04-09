//
//  ExpoItems.swift
//  Expo1900
//
//  Created by YB on 2021/04/08.
//

import Foundation

struct ExpoItems: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name, description
        case imageName = "image_name"
        case shortDescription = "short_desc"
    }
}
