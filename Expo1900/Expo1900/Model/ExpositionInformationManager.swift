//
//  ExpositionInformationManager.swift
//  Expo1900
//
//  Created by Ellen on 2021/07/16.
//

import UIKit

struct ExpositionInformationManager {
    
    func decodejsonData() throws -> ExpositionInformation {
        guard let jsonData = NSDataAsset(name: String(describing: JsonFileName.exposition_universelle_1900))?.data else {
            throw JsonDataFetchError.dataNotFound
        }
        
        do {
            return try JSONDecoder().decode(ExpositionInformation.self, from: jsonData)
        } catch {
            throw JsonDataFetchError.failDecoding
        }
    }
}
