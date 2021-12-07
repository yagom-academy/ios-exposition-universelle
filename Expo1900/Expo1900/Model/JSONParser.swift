//
//  JSONParser.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/07.
//

import UIKit

enum JSONParser<Element: Decodable> {
    static func decode(from jsonName: String) -> Element? {
        guard let dataAsset = NSDataAsset(name: jsonName) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        let decodedData = try? decoder.decode(Element.self, from: dataAsset.data)
        
        return decodedData
    }
}
