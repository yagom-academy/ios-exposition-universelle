//
//  Expo1900 - ViewController.swift
//  Created by sunnyCookie, Wonbi
// 

import UIKit

class ViewController: UIViewController {
    var expoInformation: ExpoInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let expoInformationData = JSONDecoder.decoding(
            ExpoInformation.self,
            from: "exposition_universelle_1900"
        ) else { return }
        
        expoInformation = expoInformationData
    }
}
