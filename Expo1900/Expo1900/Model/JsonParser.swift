//
//  JsonParser.swift
//  Expo1900
//
//  Created by Baek on 2022/06/14.
//

import UIKit

enum JsonParser<T:Decodable> {
    static func fetch(_ fileName: String) throws -> Result<T, JsonError>? {
        let jsonDecoder = JSONDecoder()
        
        do {
            guard let asset = NSDataAsset.init(name: fileName) else {
                return .failure(JsonError.noneFile)
            }
            return .success(try jsonDecoder.decode(T.self, from: asset.data))
        } catch {
            return .failure(JsonError.decodingFailure)
        }
    }
}
