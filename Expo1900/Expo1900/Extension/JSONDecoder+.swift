//
//  JSONDecoder+.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/29.
//

import UIKit

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from AssetName: String) throws -> T {
        guard let json = NSDataAsset(name: AssetName) else {
            throw NSDataAssetError.assetNotFound
        }
                
        return try JSONDecoder().decode(type, from: json.data)
    }
}
