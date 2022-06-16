//
//  Exhibits.swift
//  Expo1900
//
//  Created by yeton, 수꿍 on 2022/06/13.
//
struct Exhibits: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}

extension Exhibits {
    func getImage() {
        return
    }
}

