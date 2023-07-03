//
//  JSONDecoder+.swift
//  Expo1900
//
//  Created by Hemg, RedMango on 2023/06/27.
//

import Foundation

extension JSONDecoder {
    func decodingContentInfo<T:Decodable>(with contentData: Data, modelType:T.Type) throws -> T {
        let decodedModel = try self.decode(T.self, from: contentData)
        
        return decodedModel
    }
}
