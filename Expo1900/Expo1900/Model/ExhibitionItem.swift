//
//  ExhibitionItems.swift
//  Expo1900
//
//  Created by Kiseok, Toy on 2023/10/31.
//


struct ExhibitionItem: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description = "desc"
        case imageName = "image_name"
        case shortDescription = "short_desc"
    }
}
