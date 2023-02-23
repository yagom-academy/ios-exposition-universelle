//
//  JSONDecoderExtension.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/23.
//

import UIKit

extension JSONDecoder {
    func loadJSONData<T>(name: String, type: T.Type) -> Result<T, Error> where T : Decodable {
        guard let dataAsset = NSDataAsset(name: name) else {
            return .failure(DataAssetError.invalidFileName)
        }
        
        do {
            let data = try self.decode(type, from: dataAsset.data)
            
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
}
