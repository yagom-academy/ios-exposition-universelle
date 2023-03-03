//
//  DecodingJson.swift
//  Expo1900
//
//  Created by Christy Lee on 2023/02/28.
//

import UIKit

struct Decoder {
    let decoder: JSONDecoder = JSONDecoder()
    
    func decodeExpositionJson() -> ExpositionUniverselle {
        let emptyData: ExpositionUniverselle =
        ExpositionUniverselle(title: NameSpace.emptyString,
                            visitorCount: Int.zero,
                            location: NameSpace.emptyString,
                            duration: NameSpace.emptyString,
                            description: NameSpace.emptyString)
        
        guard let expositionUniverselle: NSDataAsset  = NSDataAsset(name: "exposition_universelle_1900"),
              let decodedExpositionUniverselle: ExpositionUniverselle = try? decoder.decode(ExpositionUniverselle.self, from: expositionUniverselle.data)
        else { return emptyData }

        return decodedExpositionUniverselle
    }
    
    func decodeItemsJson() -> [ExhibitItem] {
        let emptyArray: [ExhibitItem] = []
        
        guard let items: NSDataAsset = NSDataAsset(name: "items"),
              let decodedItems: [ExhibitItem] = try? decoder.decode([ExhibitItem].self, from: items.data)
        else { return emptyArray }

        return decodedItems
    }
}
