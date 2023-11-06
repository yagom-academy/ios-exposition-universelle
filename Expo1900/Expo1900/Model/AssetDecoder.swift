//
//  Decoder.swift
//  Expo1900
//
//  Created by jyubong, mireu
//

import UIKit

struct AssetDecoder<Element: Decodable> {
    let assetName: String
    
    var decodedItem: Element? {
        var item: Element?
        
        let decoder = JSONDecoder()
        
        guard let data = NSDataAsset(name: assetName)?.data else {
            return item
        }
        
        do {
            item = try decoder.decode(Element.self, from: data)
        } catch {
            print(error.localizedDescription)
        }
        
        return item
    }
}
