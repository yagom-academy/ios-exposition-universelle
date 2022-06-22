//
//  JsonParser.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/16.
//

import UIKit

struct JSONParser: DataRepository {
    static func fetch<T>(fileName: String, parsedItems: T) -> T? where T : Decodable, T : Encodable {
        let jsonDecoder = JSONDecoder()
        let parsedItemsType = type(of: parsedItems)
        guard let data = NSDataAsset(name: fileName)?.data else { return nil }
        
        do {
            let data = try jsonDecoder.decode(parsedItemsType.self, from: data)
            
            return data
        } catch {
            print(ParseError.unknown)
            return nil
        }
    }
}
