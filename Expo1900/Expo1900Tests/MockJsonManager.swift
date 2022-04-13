//
//  MockJsonManager.swift
//  Expo1900Tests
//
//  Created by 우롱차, marisol on 2022/04/13.
//

import UIKit
@testable import Expo1900

struct MockJsonManager: JsonManagerable {
    func decodedItems() throws -> [Item] {
        let jsonDecoder = JSONDecoder()
         
        guard let itemData = NSDataAsset(name: "wrongName") else {
            throw ExpoError.noFileError
        }
        
        guard let items = try? jsonDecoder.decode([Item].self, from: itemData.data) else {
            throw ExpoError.decodingError
        }
        
        return items
    }
    
    func decodedExpositionInfo() throws -> ExpositionInfo {
        let jsonDecoder = JSONDecoder()
        
        guard let expositionInfoData = NSDataAsset(name: DataFileName.items) else {
            throw ExpoError.noFileError
        }
  
        guard let expositionInfo = try? jsonDecoder.decode(ExpositionInfo.self, from: expositionInfoData.data) else {
            throw ExpoError.decodingError
        }
        
        return expositionInfo
    }
}
