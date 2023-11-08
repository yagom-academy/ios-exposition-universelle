//
//  UniverselleDecoder.swift
//  Expo1900
//
//  Created by hyunMac on 11/8/23.
//

import UIKit

struct UniverselleDecoder<T: Decodable> {
    static func decodeAssetData(assetName: String) throws -> T {
        guard let asset = NSDataAsset(name: assetName) else {
            throw AlertMessage.emptyAssetData
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: asset.data)
    }
}

