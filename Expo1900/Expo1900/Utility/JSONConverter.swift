//
//  JSONConverter.swift
//  Expo1900
//
//  Created by 김찬우 on 2021/04/09.
//

import Foundation
import UIKit

enum JSONConverterError: Error {
    case inputWrongAssetName
    case isNotMaching
}

struct JSONConverter<T: Decodable> {
    static func extractData(assetName: String) throws -> NSDataAsset {
        guard let dataAsset = NSDataAsset.init(name: assetName) else { throw JSONConverterError.inputWrongAssetName }
        return dataAsset
    }

    static func decodeAsset(of: NSDataAsset) throws -> T {
        let decoder = JSONDecoder()
    
        guard let convertedData: T = try? decoder.decode(T?.self, from: of.data) else { throw JSONConverterError.isNotMaching }
            return convertedData
    }
}

