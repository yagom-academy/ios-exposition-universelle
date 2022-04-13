//
//  Decodable+Extension.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

extension Decodable {
    static func decode(from fileName: String) -> Result<Self, DecodingError> {
        guard let asset = NSDataAsset(name: fileName) else {
            return .failure(.fileNameNotFound)
        }
        
        guard let decodedData = try? JSONDecoder().decode(Self.self, from: asset.data) else {
            return .failure(.decodeError)
        }
        
        return .success(decodedData)
    }
}
