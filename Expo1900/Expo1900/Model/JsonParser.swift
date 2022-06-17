//
//  JsonParser.swift
//  Expo1900
//
//  Created by Baek on 2022/06/14.
//

import UIKit

enum JsonParser<T:Decodable> {
    static func fetch(_ fileName: String) throws -> T? {
        let jsonDecoder = JSONDecoder()
        var entity: T?
        
        if let asset = NSDataAsset.init(name: fileName) {
            do {
                entity = try jsonDecoder.decode(T.self, from: asset.data)
            } catch {
                throw JsonError.decodingFailure
            }
        } else {
            throw JsonError.noneFile
        }
        
        return entity
    }
}
