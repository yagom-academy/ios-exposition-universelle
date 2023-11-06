//
//  AssetParser.swift
//  Expo1900
//
//  Created by Hisop on 2023/11/06.
//

import UIKit

enum dataAssetError: LocalizedError {
    case dataAssetNameError
    
    var errorDescription: String? {
        switch self {
        case .dataAssetNameError:
            return "dataAssetNameError"
        }
    }
}

struct AssetParser<T: Decodable> {
    func decodeDataAsset(assetName: String) throws -> T {
        guard let dataAsset = NSDataAsset(name: assetName) else {
            throw dataAssetError.dataAssetNameError
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: dataAsset.data)
        } catch {
            throw error
        }
    }
}
