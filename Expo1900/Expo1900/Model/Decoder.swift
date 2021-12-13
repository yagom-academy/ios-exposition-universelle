//
//  Decoder.swift
//  Expo1900
//
//  Created by Sunwoo on 2021/12/13.
//

import UIKit

let decoder = JSONDecoder()

func parseExpositionJSON() -> Exposition? {
    guard let expositionJSON: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
        fatalError()
    }
    
    let decodedExpositionData = try? decoder.decode(Exposition.self, from: expositionJSON.data)
    
    return decodedExpositionData
}
