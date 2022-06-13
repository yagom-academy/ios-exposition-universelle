//
//  Item.swift
//  Expo1900
//
//  Created by dhoney96 on 2022/06/13.
//

import Foundation

struct Entry: Codable, Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
            case name
            case imageName = "image_name"
            case shortDesc = "short_desc"
            case desc
    }
}



