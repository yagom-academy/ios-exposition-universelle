//
//  JSONDecodingManager.swift
//  Expo1900
//
//  Created by Hamo, Mene on 2022/10/21.
//

import UIKit

final class JSONDecodingManager {
    private let jsonDecoder: JSONDecoder = JSONDecoder()

    func decode<T: Decodable>(dataAsset: String) throws -> T {
        guard let dataAsset: NSDataAsset = NSDataAsset(
            name: dataAsset) else {
            throw ExpoError.dataAssetError
        }
        
        let data = try jsonDecoder.decode(T.self, from: dataAsset.data)
        
        return data
    }
}


