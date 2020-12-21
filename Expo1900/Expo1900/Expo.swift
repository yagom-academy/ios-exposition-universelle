//
//  Expo.swift
//  Expo1900
//
//  Created by 임리나 on 2020/12/21.
//

import Foundation

struct ParisExpo: Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let descripton: String
}

struct KoreanExpo: Codable {
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
