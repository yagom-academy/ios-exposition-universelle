//
//  ExpositionItemManager.swift
//  Expo1900
//
//  Created by Ellen on 2021/07/16.
//

import UIKit

struct ExpositionItemManager {
    
    func decodejsonData() throws -> [ExpositionItem] {
        guard let jsonData = NSDataAsset(name: String(describing: JsonFileName.items))?.data else {
            throw JsonDataFetchError.dataNotFound
        }
        
        do {
            return try JSONDecoder().decode([ExpositionItem].self, from: jsonData)
        } catch {
            throw JsonDataFetchError.failDecoding
        }
    }
}
