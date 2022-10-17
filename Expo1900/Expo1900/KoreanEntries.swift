//  KoreanEntries.swift
//  Created by Mangdi, zhilly on 2022/10/17

import Foundation

struct KoreanEntries: Codable {
    let name: String
    let image_name: String
    let short_desc: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case name, desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
}
