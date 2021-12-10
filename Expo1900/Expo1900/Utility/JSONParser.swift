//
//  JSONParser.swift
//  Expo1900
//
//  Created by 양호준 on 2021/12/07.
//

import UIKit

struct JSONParser<Item: Decodable> {
    func decode(fileName: String) throws -> Item {
        guard let jsonData = NSDataAsset(name: fileName) else {
            throw ParsingError.fileNotFound
        }
        
        let jsonDecoder = JSONDecoder()
        let decodedData = try jsonDecoder.decode(Item.self, from: jsonData.data)
        
        return decodedData
    }
}
