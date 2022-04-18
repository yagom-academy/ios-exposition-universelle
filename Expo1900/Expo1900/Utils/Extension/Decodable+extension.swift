//
//  Decodable+extension.swift
//  Expo1900
//
//  Created by 김태현 on 2022/04/14.
//

import Foundation
import UIKit

enum DecoderError: Error {
    case decodeFail
    case dataAssetFail
}

extension Decodable {
    static func convert(from fileName: String) throws -> Self {
        guard let assetFile = NSDataAsset(name: fileName) else {
            throw DecoderError.dataAssetFail
        }
        
        guard let data = try? JSONDecoder().decode(Self.self, from: assetFile.data) else {
            throw DecoderError.decodeFail
        }
        
        return data
    }
}
