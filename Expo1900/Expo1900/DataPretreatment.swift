//
//  DataManager.swift
//  Expo1900
//
//  Created by 김민성 on 2021/04/15.
//

import Foundation
import UIKit

class DataPretreatment {
    var data = Data()
    
    func extractExternalData(from path: String) throws {
        guard let mainText = try? String(contentsOfFile: path ) else {
            throw Errors.emptyDataError
        }
        data = try encodedData(mainText)
    }
      
    func extractInternalData(from path: NSDataAssetName) throws {
        guard let itemData = NSDataAsset(name: path) else {
            throw Errors.emptyDataError
        }
        data = itemData.data
        
    }
    
    private func encodedData(_ data: String) throws -> Data {
        guard let text = data.data(using: .utf8) else {
            throw Errors.invalidDataTypeError
        }
        return text
    }
}
