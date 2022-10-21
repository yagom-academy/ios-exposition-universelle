//  Exhibit.swift
//  Expo1900
//  Created by inho, LJ  on 2022/10/18.

import UIKit

struct Exhibit: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
