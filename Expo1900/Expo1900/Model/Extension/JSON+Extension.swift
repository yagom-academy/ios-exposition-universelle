//  JSON+Extension.swift
//  Expo1900
//  Created by inho, LJ  on 2022/10/20.

import UIKit

extension JSONDecoder {
    static let jsonDecoder: JSONDecoder = .init()
    
    static func parse<T: Decodable>(asset: String, to dataType: T.Type) throws -> T {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: asset) else {
            throw ExpositionError.invalidAsset
        }
        
        return try jsonDecoder.decode(T.self, from: dataAsset.data)
    }
}
