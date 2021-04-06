//
//  EntryWorkItem.swift
//  Expo1900
//
//  Created by 배은서 on 2021/04/06.
//

import Foundation

struct EntryWorkItem: Decodable {
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
