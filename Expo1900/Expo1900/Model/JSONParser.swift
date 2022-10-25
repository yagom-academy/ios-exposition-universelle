//  Expo1900 - JSONProcessor.swift
//  Created by Ayaan, Bella on 2022/10/21.
//  Copyright © yagom academy. All rights reserved.

import UIKit

struct JSONParser {
    private init() {}
    static func parseJSON<T>(_ dataType: T.Type, from dataName: String) -> T? where T: Decodable {
        guard let dataAsset: NSDataAsset = fetchDataAsset(from: dataName) else {
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
}
