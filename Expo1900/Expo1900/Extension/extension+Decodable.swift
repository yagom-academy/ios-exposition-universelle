//
//  extension+Decodable.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/12.
//

import UIKit

extension Decodable {
    static func decode(with assetName: String) throws -> Self {
        guard let asset = NSDataAsset.init(name: assetName) else { throw DataLoadError.assetLoadError }
        
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(Self.self, from: asset.data)
            return data
        } catch _ as DecodingError{
            throw DataLoadError.dataLoadError
        }
    }
}
