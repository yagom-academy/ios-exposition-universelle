//
//  Decoder.swift
//  Expo1900
//
//  Created by Hyungmin Lee on 2023/06/29.
//

import UIKit

enum Decoder {
    static func decode<T: Decodable>(fileName: String) -> T? {
        let jsonDecoder = JSONDecoder()
        guard let asset = NSDataAsset(name: fileName) else { return nil }
        
        do {
            let data = try jsonDecoder.decode(T.self, from: asset.data)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
