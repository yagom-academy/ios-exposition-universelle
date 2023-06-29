//
//  DecodingManager.swift
//  Expo1900
//
//  Created by Whales on 2023/06/29.
//

import UIKit

struct DecodingManager {
    let decoder: JSONDecoder = JSONDecoder()
    
    func decodeExpositionJSON() -> ExpositionEntity {
        guard let exposition: NSDataAsset = NSDataAsset(name: AssetNamespace.expositionUniverselle),
              let decodedExposition: ExpositionEntity = try? decoder.decode(ExpositionEntity.self, from: exposition.data)
        else {
            return ExpositionEntity.init(title: "", visitors: 0, location: "", duration: "", description: "")
        }
        
        return decodedExposition
    }
    
    func decodeExpositionItemsJSON() -> [ExpositionItemEntity] {
        guard let expositionItems: NSDataAsset = NSDataAsset(name: AssetNamespace.items),
              let decodedExpositionItems: [ExpositionItemEntity] = try? decoder.decode([ExpositionItemEntity].self, from: expositionItems.data)
        else {
            return [ExpositionItemEntity.init(name: "", imageName: "", shortDescription: "", description: "")]
        }
        
        return decodedExpositionItems
    }
}
