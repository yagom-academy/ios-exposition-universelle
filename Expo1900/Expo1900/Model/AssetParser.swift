//
//  AssetParser.swift
//  Expo1900
//
//  Created by Hisop on 2023/11/06.
//

import UIKit

enum DataAssetError: LocalizedError {
    case dataAssetNameError
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .dataAssetNameError:
            return "데이터를 불러오지 못했습니다"
        case .decodingError:
            return "데이터를 해석하지 못했습니다"
        }
    }
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
