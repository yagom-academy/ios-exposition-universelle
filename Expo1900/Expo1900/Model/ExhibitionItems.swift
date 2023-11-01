//
//  ExhibitionItems.swift
//  Expo1900
//
//  Created by Kiseok, Toy on 2023/10/31.
//


struct ExhibitionItems: Decodable {
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
