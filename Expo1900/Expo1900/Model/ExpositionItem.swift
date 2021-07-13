//
//  ExpositionItem.swift
//  Expo1900
//
//  Created by EHD, Hosinging on 2021/07/07.
//

import Foundation

struct ExpositionItem: Codable {
    
    //MARK: -Property
    let items: [Item]
}

struct Item: Codable {
    
    //MARK: - Property
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
