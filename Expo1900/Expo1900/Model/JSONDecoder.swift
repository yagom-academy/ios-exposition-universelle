//
//  JSONDecoder.swift
//  Expo1900
//
//  Created by baem,woong on 2022/10/20.
//

import UIKit

extension JSONDecoder {
    static let jsonDecoder: JSONDecoder = .init()
    
    static func decodeData<T: Decodable>(_ assetName: String, to dataType: T.Type) -> T? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: assetName) else {
            return nil
        }
        
        do {
            return try Self.jsonDecoder.decode(T.self, from: dataAsset.data)
        } catch {
            return nil
        }
    }
}



