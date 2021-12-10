//
//  Expo1900 - ViewController.swift
//  Created by yeha.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoMainViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitersLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var explainationTextView: UITextView!
    let expoMainInformationJSONFile = "exposition_universelle_1900"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupExpoMainView()
    }
    
    private func setupExpoMainView() {
        guard let expoMainInformation = decodeExpoMainInformationJsonData() else {
            return
        }
        titleLabel.text = expoMainInformation.title
        visitersLabel.text = expoMainInformation.visitors.description
        locationLabel.text = expoMainInformation.location
        durationLabel.text = expoMainInformation.duration
        explainationTextView.text = expoMainInformation.explanation
    }

    private func decodeExpoMainInformationJsonData() -> ExpoMainInformation? {
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
    
    private func convertToNSDataAsset(from fileName: String) throws -> NSDataAsset  {
        guard let jsonData = NSDataAsset(name: fileName) else {
            throw JSONDataError.fileConversionFailed(fileName)
        }
        return jsonData
    }
}

