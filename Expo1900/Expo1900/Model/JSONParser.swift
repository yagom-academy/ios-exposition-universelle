//
//  JSONParser.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/16.
//

import UIKit

struct JSONParser: DataRepository {
    static func fetch<T: Codable>(fileName: String, parsedItems: T) -> T? {
        let jsonDecoder = JSONDecoder()
        let parsedItemsType = type(of: parsedItems)
        
        guard let dataAsset = NSDataAsset(name: fileName) else { return nil }
        
        do {
            let data = try jsonDecoder.decode(parsedItemsType.self, from: dataAsset.data)
            
            return data
        } catch {
            print(ParseError.unknown)
            return nil
        }
    }
}
