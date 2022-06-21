//
//  Entry.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/13.
//

import UIKit

struct Entry: Codable {
    let name: String
    private let imageName: String
    let shortDescription: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case desc = "desc"
    }
}

extension Entry {
    var image: UIImage? {
        return UIImage(named: imageName)
    }
}
