//
//  ExhibitModel.swift
//  Expo1900
//
//  Created by sookim on 2021/04/07.
//

import Foundation

struct Exhibits: Decodable {
    let name: String
    let image_name: String
    let short_desc: String
    let desc: String
    
    enum ExhibitsCodingkeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
