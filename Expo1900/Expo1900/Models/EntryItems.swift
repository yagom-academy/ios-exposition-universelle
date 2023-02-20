//
//  EntryItems.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/20.
//

import Foundation

struct EntryItems: Codable {
    let name: String
    let imageName: String
    let shortDescrition: String
    let description: String
    
    private enum CondingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
