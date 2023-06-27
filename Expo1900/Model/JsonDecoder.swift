//
//  JsonDecoder.swift
//  Expo1900
//
//  Created by Hemg, RedMango on 2023/06/27.
//

import Foundation

struct JsonDecoder {
    private func decodingContentInfo<T:Decodable>(with contentData: Data, modelType:T.Type) throws -> T {
        let jsonDecoder = JSONDecoder()
        let decodedModel = try jsonDecoder.decode(T.self, from: contentData)
        
        return decodedModel
    }
    
    func decodingExposition(contentData: Data) throws -> Exposition  {
        let expositionInfo: Exposition = try decodingContentInfo(with: contentData, modelType: Exposition.self)
        return expositionInfo
    }
    
    func decodingItem(contentData: Data) throws -> Item  {
        let itemInfo: Item = try decodingContentInfo(with: contentData, modelType: Item.self)
        return itemInfo
    }
}
