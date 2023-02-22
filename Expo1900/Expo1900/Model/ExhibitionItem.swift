//
//  ExhibitionItem.swift
//  Expo1900
//
//  Created by Harry, 레옹아범 on 2023/02/20.
//

import UIKit

struct ExhibitionItem: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    var image: UIImage? {
        return UIImage(named: self.imageName)
    }
    
    enum Codingkeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
