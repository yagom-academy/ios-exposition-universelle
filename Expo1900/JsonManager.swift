//
//  JsonManager.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/12.
//

import Foundation
import UIKit

protocol JsonManagerable {
    func getDecodedItems() -> [Item]?
    func getDecodedExpositionInfo() -> ExpositionInfo?
}

struct JsonManager: JsonManagerable {
    func getDecodedItems() -> [Item]? {
        var items: [Item]? = []
        let jsonDecoder = JSONDecoder()
        
        guard let itemData: NSDataAsset = NSDataAsset(name: "items") else { return nil }
        
        items = try? jsonDecoder.decode([Item].self, from: itemData.data)
        return items
    }
    
    func getDecodedExpositionInfo() -> ExpositionInfo? {
        var expositionInfo: ExpositionInfo?
        let jsonDecoder = JSONDecoder()
        
        guard let expositionInfoData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return nil }
  
        expositionInfo = try? jsonDecoder.decode(ExpositionInfo.self, from: expositionInfoData.data)
        return expositionInfo
    }
}
