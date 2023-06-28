//
//  ExpositionUniverselle.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/26.
//
import UIKit

struct ExpositionUniverselle: Codable {
    var title: String
    var visitors: Int
    var location: String
    var duration: String
    var description: String
    
    static func decodeExpositionUniverselle() throws -> ExpositionUniverselle {
        guard let json = NSDataAsset(name: "exposition_universelle_1900") else {
            throw NSDataAssetError.assetNotFound
        }
                
        return try JSONDecoder().decode(ExpositionUniverselle.self, from: json.data)
    }
}
