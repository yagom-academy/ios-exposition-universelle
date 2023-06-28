//
//  Decoder.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/28.
//

import UIKit

struct Decoder<T: Decodable> {
    static func decodeJSON(_ dataAssetName: String) throws -> T {
        let decoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: dataAssetName) else {
            throw DecoderError.notFoundAsset
        }
        
        return try decoder.decode(T.self, from: dataAsset.data)
    }
}
