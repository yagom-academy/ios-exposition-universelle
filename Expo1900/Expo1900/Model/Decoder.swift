//
//  JsonDecoder.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/03.
//

import UIKit

enum Decoder {
    static func decodeJson<T: Decodable>(from dataAssetName: String) throws -> T {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset = NSDataAsset(name: dataAssetName) else {
            throw DecodeError.searchNoFile
        }
        
        do {
            let decodeData = try jsonDecoder.decode(T.self, from: dataAsset.data)
            
            return decodeData
        } catch {
            throw DecodeError.jsonDecodeError
        }
    }
}
