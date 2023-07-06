//
//  DecodingManager.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/29.
//

import UIKit

final class DecodingManager {
    static let shared = DecodingManager()
    
    private init() {}
    
    func decodeJSON<T: Decodable>(fileName: String, type: T.Type) throws -> T {
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: fileName),
              let decodedData: T = try? decoder.decode(T.self, from: dataAsset.data)
        else {
            throw DecodingError.failedDecoding
        }
        
        return decodedData
    }
}
