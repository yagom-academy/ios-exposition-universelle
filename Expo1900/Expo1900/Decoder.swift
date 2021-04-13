//
//  Decoder.swift
//  Expo1900
//
//  Created by 김민성 on 2021/04/13.
//

import Foundation
import UIKit

struct Decoder {
    let decoder = JSONDecoder()
    
    private func extractData(_ path: String) throws -> Data {
        guard let mainText = try? String(contentsOfFile: path ) else {
            throw Errors.emptyDataError
        }
        return try encodingData(mainText)
    }
    
    private func encodingData(_ data: String) throws -> Data {
        guard let text = data.data(using: .utf8) else {
            throw Errors.invalidDataTypeError
        }
        return text
    }

    func decodeData<T: Decodable>(_ object: T.Type, of path: String) {
        do {
            let contents = try decoder.decode(object, from: extractData(path))
            print(contents)
        }
        catch {
            print(error)
        }
    }
    
    func decodeAssetData<T: Decodable>(_ object: T.Type, _ assetData: NSDataAssetName) {
        guard let itemData = NSDataAsset(name: assetData) else { return }
        
        do {
            let decodedData = try decoder.decode(object, from: itemData.data)
            print(decodedData)
        }
        catch {
            print(error)
        }
    }
}
