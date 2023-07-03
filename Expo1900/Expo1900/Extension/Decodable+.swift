//
//  Decodable+.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/27.
//

import UIKit

extension Decodable {
    static func decode(_ file: String) throws -> Self {
        guard let dataAsset = NSDataAsset(name: file) else {
            throw DecodeError.noFile
        }

        return try JSONDecoder().decode(Self.self, from: dataAsset.data)
    }
}
