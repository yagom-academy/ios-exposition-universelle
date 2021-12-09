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
        } catch {
            print(error.localizedDescription)
        }
        return expoMainInformation
    }
    
    func convertToNSDataAsset(from file: String) throws -> NSDataAsset  {
        guard let jsonData = NSDataAsset(name: file) else {
            throw fatalError()
        }
        return jsonData
    }
}

