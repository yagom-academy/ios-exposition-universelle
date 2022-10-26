//
//  ExhibitionWork.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/18.
//

struct ExhibitionWork: Codable {
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

