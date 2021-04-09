//
//  JSONParser.swift
//  Expo1900
//
//  Created by duckbok on 2021/04/09.
//

import Foundation
import UIKit

enum JSONParser<Type: Decodable> {
    static func extractData(by dataName: String) -> NSDataAsset? {
        guard let dataAsset = NSDataAsset(name: dataName) else { return nil }
        
        return dataAsset
    }
    
    static func converter(by dataAsset: NSDataAsset) -> Type? {
        let decoder = JSONDecoder()
        guard let instance: Type = try? decoder.decode(Type.self, from: dataAsset.data) else { return nil }
        
        return instance
    }
}
