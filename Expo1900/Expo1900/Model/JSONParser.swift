//  Expo1900 - JSONProcessor.swift
//  Created by Ayaan, Bella on 2022/10/21.
//  Copyright © yagom academy. All rights reserved.

import UIKit.NSDataAsset

enum JSONParser {
    static func parsed<T>(to dataType: T.Type) -> T? where T: Decodable {
        guard let dataName: String = fetchDataName(for: dataType),
              let dataAsset: NSDataAsset = fetchDataAsset(from: dataName) else {
            return nil
        }
        
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: dataAsset.data)
        } catch {
            return nil
        }
    }
    
    private static func fetchDataAsset(from dataName: String) -> NSDataAsset? {
        return NSDataAsset(name: dataName)
    }
    
    private static func fetchDataName<T>(for dataType: T.Type) -> String? {
        switch dataType {
        case is ExpositionUniverselle.Type:
            return DataAsset.expositionUniverselleInfomation
        case is Array<ExpositionUniverselleItem>.Type:
            return DataAsset.expositionItems
        default:
            return nil
        }
    }
}
