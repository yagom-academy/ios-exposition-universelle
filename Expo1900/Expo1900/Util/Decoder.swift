//
//  Decoder.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/29.
//

import UIKit

struct Decoder {
    static func decode<T: Decodable>(_ decoder: JSONDecoder = JSONDecoder(),fileName: String) -> T? {
        guard let asset = NSDataAsset(name: fileName) else { return nil }
        
        guard let data = try? decoder.decode(T.self, from: asset.data) else { return nil }
        
        return data
    }
}
