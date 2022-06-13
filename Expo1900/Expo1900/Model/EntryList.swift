//
//  EntryList.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/13.
//

import Foundation

struct EntryList: Codable {
    var name: String
    var imageName: String
    var shortDesc: String
    var desc: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case desc
    }
}
