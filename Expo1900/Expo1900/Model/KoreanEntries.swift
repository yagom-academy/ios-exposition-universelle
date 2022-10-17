//  KoreanEntries.swift
//  Created by Mangdi, zhilly on 2022/10/17

struct KoreanEntries: Codable {
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case name, desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
}
