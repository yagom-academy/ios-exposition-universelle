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
                
        guard let assetData = NSDataAsset.init(name: AssetName.expoIntro) else { throw DataError.noneDataError }
        
        guard let introData = try? decoder.decode(ExpositionIntroduction.self, from: assetData.data) else {
            throw DataError.decodingError
        }
        
        return introData
    }
}
