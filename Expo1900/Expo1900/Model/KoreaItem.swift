//
//  KoreaItems.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/14.
//

import UIKit

struct KoreaItem: Decodable {
    private(set) var name: String
    private(set) var imageName: String
    private(set) var shortDescription: String
    private(set) var description: String
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
