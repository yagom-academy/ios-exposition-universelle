//
//  Decoder.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/29.
//

import UIKit

enum Decoder {
    enum File {
        case expositionItems
        case parisExposition
        
        var name: String {
            switch self {
            case .expositionItems:
                return "items"
            case .parisExposition:
                return "exposition_universelle_1900"
            }
        }
    }
    
    static func decode<T: Decodable>(file: File) -> T? {
        let jsonDecoder = JSONDecoder()
        guard let asset = NSDataAsset(name: file.name) else { return nil }
        
        do {
            let data = try jsonDecoder.decode(T.self, from: asset.data)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
