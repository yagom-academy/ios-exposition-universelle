//
//  KoreaEntryDetail.swift
//  Expo1900
//
//  Created by 김태훈 on 2022/04/11.
//

import Foundation

struct KoreaEntryDetail: Decodable {
    let name: String
    let imageFileName: String
    let shortDescription: String
    let fullDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageFileName = "image_name"
        case shortDescription = "short_desc"
        case fullDescription = "desc"
    }
}
