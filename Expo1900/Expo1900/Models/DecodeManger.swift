//
//  DataManager.swift
//  Expo1900
//
//  Created by Kyo, tottalE on 2022/10/19.
//

import UIKit

struct DecodeManger<T: Decodable> {
    
    private let decoder = JSONDecoder()
    
    func fetchData(name: String) throws -> T? {
                
        guard let assetData = NSDataAsset.init(name: name) else { throw DataError.noneDataError }
        
        guard let itemData = try? decoder.decode(T.self, from: assetData.data) else {
            throw DataError.decodingError
        }
        
        return itemData
    }
    
    func fetchDataList(name: String) throws -> [T] {
        
        guard let assetData = NSDataAsset.init(name: name) else { throw DataError.noneDataError }
        
        guard let itemDatas = try? decoder.decode([T].self, from: assetData.data) else {
            throw DataError.decodingError
        }
        
        return itemDatas
    }
}
