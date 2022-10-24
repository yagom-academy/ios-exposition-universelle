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
        
        guard let introData = try? decoder.decode(T.self, from: assetData.data) else {
            throw DataError.decodingError
        }
        
        return introData
    }
    
    func fetchDataList(name: String) throws -> [T] {
        
        guard let assetData = NSDataAsset.init(name: name) else { throw DataError.noneDataError }
        
        guard let koreaItems = try? decoder.decode([T].self, from: assetData.data) else {
            throw DataError.decodingError
        }
        
        return koreaItems
    }
}
