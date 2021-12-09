//
//  Expo1900 - ViewController.swift
//  Created by yeha.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    let expoMainInformationJSONFile = "exposition_universelle_1900"

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let expoMainInformation = decodeExpoMainInformationJsonData() else {
            return
        }
    }

    func decodeExpoMainInformationJsonData() -> ExpoMainInformation? {
        var expoMainInformation: ExpoMainInformation?
        let jsonDecoder = JSONDecoder()
        
        do {
            let jsonData = try convertToNSDataAsset(from: expoMainInformationJSONFile)
            expoMainInformation = try jsonDecoder.decode(ExpoMainInformation.self, from: jsonData.data)
        } catch JSONDataError.fileConversionFailed(let fileName) {
            print(JSONDataError.fileConversionFailed(fileName).description)
        } catch {
            print(error.localizedDescription)
        }
        return expoMainInformation
    }
    
    func convertToNSDataAsset(from fileName: String) throws -> NSDataAsset  {
        guard let jsonData = NSDataAsset(name: fileName) else {
            throw JSONDataError.fileConversionFailed(fileName)
        }
        return jsonData
    }
}

