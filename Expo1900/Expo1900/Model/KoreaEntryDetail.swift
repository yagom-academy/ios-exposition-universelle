//
//  KoreaEntryDetail.swift
//  Expo1900
//
//  Created by 김태훈 on 2022/04/11.
//

import Foundation

struct KoreaEntryDetail: Codable {
    var name: String
    var imageFileName: String
    var shortDescription: String
    var fullDescription: String
    
    enum KoreaEntryDetailCodingKeys: String, CodingKey {
        case name
        case imageFileName = "image_name"
        case shortDescription = "short_desc"
        case fullDescription = "desc"
    }
}
