//
//  Entry.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/26.
//

import Foundation

struct Entry: Codable {
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case imageName = "image_name"
        case shortDesc = "short_desc"
        
        case name
        case desc
    }
}
