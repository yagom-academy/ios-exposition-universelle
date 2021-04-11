//
//  ExhibitModel.swift
//  Expo1900
//
//  Created by sookim on 2021/04/07.
//

import Foundation

struct KoreaExhibitItem: Decodable {
    let name: String
    let image_name: String
    let short_desc: String
    let desc: String
    
    private enum Codingkeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
