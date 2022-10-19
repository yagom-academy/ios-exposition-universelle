//
//  DataManager.swift
//  Expo1900
//
//  Created by Kyo, tottalE on 2022/10/19.
//

import UIKit

struct DataManager {
    
    let decoder = JSONDecoder()
    
    func fetchExpoIntroData() throws -> ExpositionIntroduction? {
        
        var introData: ExpositionIntroduction?
        guard let assetData = NSDataAsset.init(name: AssetName.expoIntro) else { throw DataError.noneDataError }
        
        do {
            introData = try decoder.decode(ExpositionIntroduction.self, from: assetData.data)
        } catch {
            if let error = error as? DataError {
                print(error.message)
            } else {
                print(DataError.unknownError.message)
            }
        }
        
        return introData
    }
}
