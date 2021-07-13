//
//  JsonDecoder.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/12.
//

import UIKit

enum JsonDecoderError: Error {
    case invalidAssetName
    case failedDecode
}

struct JsonDecoder {
    func decode<T: Decodable>(name: String, type: T.Type) throws -> T {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: name) else {
            throw JsonDecoderError.invalidAssetName
        }
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let value = try? jsonDecoder.decode(type, from: dataAsset.data) else {
            throw JsonDecoderError.failedDecode
        }
        return value
    }
}
