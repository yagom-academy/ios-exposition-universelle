//
//  JSONDecodeExtension.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/25.
//

import UIKit

extension JSONDecoder {
    static func decodeAsset<T: Decodable>(name: String, to type: T.Type ) -> T? {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        var decodedData: T?
        guard let dataAsset: NSDataAsset = NSDataAsset(name: name) else {
            return nil
        }
        
        do {
            decodedData = try jsonDecoder.decode(T.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        return decodedData
    }
}
