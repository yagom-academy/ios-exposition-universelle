//
//  ExpositionModel.swift
//  Expo1900
//
//  Created by 임성민 on 2020/12/23.
//

import UIKit

class DataModel<T: Decodable> {
    var exposition: Exposition?
    
    init() {
        self.decode()
    }
    
    private func decode() -> T? {
        let jsonDecoder = JSONDecoder()
        guard let expositionDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return nil }
        
        do {
            return try jsonDecoder.decode(T.self, from: expositionDataAsset.data)
        } catch {
            return nil
        }
    }
}
