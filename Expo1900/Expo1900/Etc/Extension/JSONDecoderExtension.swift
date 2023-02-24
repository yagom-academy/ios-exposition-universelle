//
//  JSONDecoderExtension.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/23.
//

import UIKit

extension JSONDecoder {
    func loadJSONData<T: Decodable>(name: String, type: T.Type) throws -> T {
        guard let dataAsset = NSDataAsset(name: name) else {
            throw DataAssetError.invalidFileName
        }
        
        do {
            let data = try self.decode(type, from: dataAsset.data)
            
            return data
        } catch {
            throw error
        }
    }
}
