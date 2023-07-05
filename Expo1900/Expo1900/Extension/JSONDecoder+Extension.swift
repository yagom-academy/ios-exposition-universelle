//
//  JSONDecoder+Extension.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/29.
//

import UIKit

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from assetName: String) throws -> T {
        guard let json = NSDataAsset(name: assetName) else {
            throw NSDataAssetError.invalidDataAsset
        }
        
        return try JSONDecoder().decode(type, from: json.data)
    }
}
