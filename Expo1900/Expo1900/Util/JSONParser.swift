//
//  JSONParser.swift
//  Expo1900
//
//  Created by duckbok on 2021/04/09.
//

import Foundation
import UIKit

enum JSONParser<Type: Decodable> {
    static func parse(_ dataName: String) -> Type? {
        guard let dataAsset = extractData(from: dataName) else { return nil }
        
        return convert(from: dataAsset)
    }
    
    static func extractData(from dataName: String) -> NSDataAsset? {
        guard let dataAsset = NSDataAsset(name: dataName) else { return nil }
        
        return dataAsset
    }
    
    static func convert(from dataAsset: NSDataAsset) -> Type? {
        let decoder = JSONDecoder()
        guard let instance: Type = try? decoder.decode(Type.self, from: dataAsset.data) else { return nil }
        
        return instance
    }
}
