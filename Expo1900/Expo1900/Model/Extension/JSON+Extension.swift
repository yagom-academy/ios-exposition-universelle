//  JSON+Extension.swift
//  Expo1900
//  Created by inho, LJ  on 2022/10/20.

import UIKit

extension JSONDecoder {
    static let jsonDecoder: JSONDecoder = .init()
    
    static func parse<T: Decodable>(assetName: String, to dataType: T.Type) -> T? {
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
