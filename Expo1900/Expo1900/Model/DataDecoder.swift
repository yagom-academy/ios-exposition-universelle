//
//  JSONDecoder.swift
//  Expo1900
//
//  Created by 김우현 on 11/3/23.
//

import UIKit

struct DataDecoder<Element: Decodable> {
    
    mutating func parse(assetName: String) throws -> Element {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: assetName) else { throw ParseError.parseError }
        guard let decodedData = try? jsonDecoder.decode(Element.self, from: dataAsset.data) else { throw ParseError.parseError }
        
        return decodedData
    }
}
