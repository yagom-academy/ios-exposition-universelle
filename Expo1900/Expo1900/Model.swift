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

struct Decoding {
    let decoder = JSONDecoder()
    func decoding() -> Exposition? {
        guard let expositionAsset = NSDataAsset.init(name: "exposition_universelle_1900") else { return nil }
        do {
            let expositionJSON = try decoder.decode(Exposition.self, from: expositionAsset.data)
            return expositionJSON
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
