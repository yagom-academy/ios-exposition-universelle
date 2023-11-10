//
//  Decoder.swift
//  Expo1900
//
//  Created by jyubong, mireu
//

import UIKit

struct AssetDecoder<Element: Decodable> {
    func parse(assetName: String) throws -> Element {
        guard let data = NSDataAsset(name: assetName)?.data else {
            throw DecoderError.assetName
        }
        
        let decoder = JSONDecoder()
        
        guard let jsonData = try? decoder.decode(Element.self, from: data) else {
            throw DecoderError.jsonData
        }
        
        return jsonData
    }
}
