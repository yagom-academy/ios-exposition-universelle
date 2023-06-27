//
//  Decodable+.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/27.
//

import UIKit

extension Decodable {
    func decode(file: String) throws -> Self {
        guard let dataAsset = NSDataAsset(name: file) else {
            throw DecodeError.noFile
        }
        
        guard let decodedData = try? JSONDecoder().decode(Self.self, from: dataAsset.data) else {
            throw DecodeError.decodeFailed
        }
        return decodedData
    }
}
