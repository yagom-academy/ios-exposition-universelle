//
//  Decoder.swift
//  Expo1900
//
//  Created by Sunwoo on 2021/12/13.
//

import UIKit

let decoder = JSONDecoder()

func parseExpositionJSON() throws -> Exposition? {
    guard let expositionJSON: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
        throw ExpositionError.notExistData
    }
    
    let decodedExpositionData = try? decoder.decode(Exposition.self, from: expositionJSON.data)
    
    return decodedExpositionData
}

func parseEntryJSON() throws -> Entry? {
    guard let entryJSON: NSDataAsset = NSDataAsset(name: "items") else {
        throw ExpositionError.notExistData
    }
    
    let decodedEntryData = try? decoder.decode(Entry.self, from: entryJSON.data)
    
    return decodedEntryData
}
