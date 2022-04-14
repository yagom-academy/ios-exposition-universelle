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
    func decode(from fileName: String) -> Result<Self, DecoderError> {
        guard let assetFile = NSDataAsset(name: fileName) else {
            return .failure(.dataAssetFail)
        }
        
        guard let data = try? JSONDecoder().decode(Self.self, from: assetFile.data) else {
            return .failure(.decodeFail)
        }
        
        return .success(data)
    }
}
