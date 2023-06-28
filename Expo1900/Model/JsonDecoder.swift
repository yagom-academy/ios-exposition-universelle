//
//  JsonDecoder.swift
//  Expo1900
//
//  Created by Hemg, RedMango on 2023/06/27.
//

import Foundation

struct JsonDecoder {
    func decodingContentInfo<T:Decodable>(with contentData: Data, modelType:T.Type) throws -> T {
        let jsonDecoder = JSONDecoder()
        let decodedModel = try jsonDecoder.decode(T.self, from: contentData)
        
        return decodedModel
    }
}
