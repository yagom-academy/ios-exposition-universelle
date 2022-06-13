//
//  Entry.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/13.
//

struct Entry {
    var name: String
    var imageName: String
    var shortDesc: String
    var desc: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case desc = "desc"
    }
}
