//  JSON+Extension.swift
//  Expo1900
//  Created by inho, LJ  on 2022/10/20.

import UIKit

extension JSONDecoder {
    static let jsonDecoder: JSONDecoder = .init()
    
    static func parse<T: Decodable>(asset: String, to dataType: T.Type) -> T? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: asset) else {
            return nil
        }
        
        do {
            return try Self.jsonDecoder.decode(T.self, from: dataAsset.data)
        } catch {
            return nil
        }
    }
}
