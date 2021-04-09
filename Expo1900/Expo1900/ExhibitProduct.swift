//
//  ExhibitProduct.swift
//  Expo1900
//
//  Created by Seungjin Baek on 2021/04/09.
//

import Foundation

struct ExhibitProduct: Decodable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
}

enum CodingKeys: String, CodingKey {
    case name
    case imageName = "image_name"
    case shortDescription = "short_desc"
    case description = "desc"
}
