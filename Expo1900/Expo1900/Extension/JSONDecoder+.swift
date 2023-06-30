//
//  JSONDecoder+.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/27.
//

import UIKit

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from assetName: String) throws -> T {
        guard let dataAsset = NSDataAsset(name: assetName) else {
            throw DecodeError.noFile
        }
        
        return try JSONDecoder().decode(type, from: dataAsset.data)
    }
}
