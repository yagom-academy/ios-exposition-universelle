//
//  ExpositionDataManager.swift
//  Expo1900
//
//  Created by karen on 2023/07/04.
//

import UIKit

struct ExpositionDataManager {
    private let decoder: JSONDecoder = JSONDecoder()
    
    func decodeExpositionJSON() -> InternationalExposition {
        guard let expositionData = loadDataAsset(named: DataNamespace.expositionUniverselle),
              let decodedExposition = decodeData(InternationalExposition.self, from: expositionData)
        else {
            return InternationalExposition(title: DataNamespace.empty, visitors: 0, location: DataNamespace.empty, duration: DataNamespace.empty, description: DataNamespace.empty)
        }
        return decodedExposition
    }
    
    func decodeExpositionItemsJSON() -> [ExhibitionItem] {
        guard let itemsData = loadDataAsset(named: DataNamespace.items),
              let decodedExpositionItems = decodeData([ExhibitionItem].self, from: itemsData)
        else {
            return [ExhibitionItem(name: DataNamespace.empty, imageName: DataNamespace.empty, shortDescription: DataNamespace.empty, description: DataNamespace.empty)]
        }
        
        return decodedExpositionItems
    }
    
    private func loadDataAsset(named name: String) -> Data? {
        return NSDataAsset(name: name)?.data
    }
    
    private func decodeData<json: Decodable>(_ type: json.Type, from data: Data) -> json? {
        return try? decoder.decode(type, from: data)
    }
}
