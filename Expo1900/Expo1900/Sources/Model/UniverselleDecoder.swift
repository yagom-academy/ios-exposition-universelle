//
//  UniverselleDecoder.swift
//  Expo1900
//
//  Created by hyunMac on 11/8/23.
//

import UIKit

struct UniverselleDecoder {
    static func decodeAssetData<T: Decodable>(assetName: String, decoder: JSONDecoder) throws -> T {
        guard let asset = NSDataAsset(name: assetName) else {
            throw AlertMessage.emptyAssetData
        }
        
        return try decoder.decode(T.self, from: asset.data)
    }
}
