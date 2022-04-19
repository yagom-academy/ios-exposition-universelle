//
//  ParsorManager.swift
//  Expo1900
//
//  Created by 김태현 on 2022/04/19.
//

import Foundation
import UIKit

enum ParsorManager<T: Decodable> {
    static func parse(fileName: String) throws -> T {
        guard let assetFile = NSDataAsset(name: fileName) else {
            throw DecoderError.dataAssetFail
        }
        guard let data = try? JSONDecoder().decode(T.self, from: assetFile.data) else {
            throw DecoderError.decodeFail
        }
        return data
    }
}
