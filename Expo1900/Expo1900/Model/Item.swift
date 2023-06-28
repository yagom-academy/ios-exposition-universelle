//
//  Item.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/26.
//
import UIKit

struct Item: Codable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    
    static func decodeItems() throws -> [Item] {
        guard let json = NSDataAsset(name: "items") else {
            throw NSDataAssetError.assetNotFound
        }
                
        return try JSONDecoder().decode([Item].self, from: json.data)
    }
}
