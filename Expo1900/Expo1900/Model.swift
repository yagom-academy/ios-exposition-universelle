//
//  Model.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/11.
//

import Foundation
import UIKit

struct Item: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}

struct Exposition: Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

extension Decodable {
    static func decode(assetName: String) -> Decodable? {
        let decoder = JSONDecoder()
        guard let asset = NSDataAsset.init(name: assetName) else { return nil }
        if assetName == "items" {
            let json = try? decoder.decode([Self].self, from: asset.data)
            return json
        } else {
            let json = try? decoder.decode(Self.self, from: asset.data)
            return json
        }
    }
}
