//
//  ExpositionDataParse.swift
//  Expo1900
//
//  Created by goat, vetto on 2023/02/28.
//

import UIKit

enum ExpositionParser {
    
    static func expositionItemParse() -> [ExpositionItem] {
        var expositionList: [ExpositionItem] = []
        let jsonDecoder = JSONDecoder()
        
        guard let jsonData: NSDataAsset = NSDataAsset(name: JsonFile.items) else {
            return expositionList
        }
        
        do {
            expositionList = try jsonDecoder.decode([ExpositionItem].self, from: jsonData.data)
            return expositionList
        } catch {
            return expositionList
        }
    }
    
    static func mainExpositionParse() -> MainExposition {
        var expositionList = MainExposition(title: "", visitor: 0, location: "", duration: "", description: "")
        let jsonDecoder = JSONDecoder()
        
        guard let jsonData: NSDataAsset = NSDataAsset(name: JsonFile.mainExposition) else {
            return expositionList
        }
        
        do {
            expositionList = try jsonDecoder.decode(MainExposition.self, from: jsonData.data)
            return expositionList
        } catch {
            return expositionList
        }
    }
}
