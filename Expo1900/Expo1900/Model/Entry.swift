//
//  Item.swift
//  Expo1900
//
//  Created by dhoney96 on 2022/06/13.
//

import Foundation

struct Entry: Codable {
    let name: String?
    let imageName: String?
    let shortDescription: String?
    let longDescription: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case longDescription = "desc"
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        name = try? value.decode(String.self, forKey: .name)
        imageName = try? value.decode(String.self, forKey: .imageName)
        shortDescription = try? value.decode(String.self, forKey: .shortDescription)
        longDescription = try? value.decode(String.self, forKey: .longDescription)
    }
}



