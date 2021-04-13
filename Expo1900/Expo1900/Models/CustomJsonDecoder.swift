//
//  CustomJsonDecoder.swift
//  Expo1900
//
//  Created by 기원우 on 2021/04/13.
//

import UIKit

class CustomJsonDecoder {
    static let jsonDecoder = JSONDecoder()
    
    static func jsonFileDecode<modelType: Decodable>(fileName: String, model: modelType.Type) -> Result<modelType, ExpoError> {
        guard let jsonData: NSDataAsset = NSDataAsset(name: fileName) else {
            return .failure(ExpoError.invaildJsonFileName)
        }
        do {
            let result = try jsonDecoder.decode(modelType.self, from: jsonData.data)
            return .success(result)
        } catch {
            return .failure(ExpoError.failJsonParser)
        }
    }
    
}

