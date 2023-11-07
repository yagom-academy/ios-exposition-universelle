//
//  AssetParser.swift
//  Expo1900
//
//  Created by Hisop on 2023/11/06.
//

import UIKit

enum DataAssetError: Error {
    case dataAssetNameError
    case decodingError
}

struct AssetParser<T: Decodable> {
    func decodeDataAsset(assetName: String) -> Result<T, DataAssetError> {
        guard let dataAsset = NSDataAsset(name: assetName) else {
            return .failure(.dataAssetNameError)
        }
        
        let decoder = JSONDecoder()
        
        guard let result = try? decoder.decode(T.self, from: dataAsset.data) else {
            return .failure(.decodingError)
        }
        
        return .success(result)
    }
}
