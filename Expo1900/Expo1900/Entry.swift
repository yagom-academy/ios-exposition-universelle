//
//  Expo.swift
//  Expo1900
//
//  Created by 임리나 on 2020/12/21.
//

import Foundation
import UIKit

struct KoreanExpo: Codable {
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    enum CodingKeys: String, CodingKey {
        case name, desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
}
