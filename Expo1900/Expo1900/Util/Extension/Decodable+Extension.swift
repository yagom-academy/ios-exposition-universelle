//
//  Decodable+Extension.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

extension Decodable {
    static func decode(from fileName: String) throws -> Self {
        guard let asset = NSDataAsset(name: fileName) else {
            throw DecodingError.fileNameNotFound
        }
        
        guard let decodedData = try? JSONDecoder().decode(Self.self, from: asset.data) else {
            throw DecodingError.decodeError
        }
        
        return decodedData
    }
}
