//
//  JSONParser.swift
//  Expo1900
//
//  Created by YongHoon JJo on 2021/07/08.
//

import UIKit

enum JSONParserError: Error {
    case invalidName
    case failedToDecode
}

struct JSONParser {
    static func parse<T: Decodable>(name: String, type: T.Type) -> Result<T, JSONParserError> {
        guard let asset = NSDataAsset(name: name) else {
            return .failure(.invalidName)
        }
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(type, from: asset.data) else {
            return .failure(.failedToDecode)
        }
        return .success(result)
    }
}
