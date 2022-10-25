//
//  Converter.swift
//  Expo1900
//
//  Created by Rhovin, Aejong on 2022/10/25.
//


import UIKit

enum Converter {
    static let jsonDecoder = JSONDecoder()
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        return formatter
    }()
    
    static func decode<Model: Decodable>(_ file: String) -> Model? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: file) else { return nil }
        
        let model = try? Converter.jsonDecoder.decode(Model.self, from: dataAsset.data)
        
        return model
    }
}
