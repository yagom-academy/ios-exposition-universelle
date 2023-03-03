//
//  DecodeManager.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/27.
//

import UIKit

enum DecodeManager {
    static func decodeData<T: Decodable>(of name: String) -> T? {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: name) else { return nil }

        do {
            let result = try jsonDecoder.decode(T.self, from: dataAsset.data)

            return result
        } catch {
            print(error.localizedDescription)

            return nil
        }
    }
}
