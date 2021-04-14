//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func decodeExpoUniverselle() {
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset.init(name: "expo_assets") else {
            return
        }
        let data = dataAsset.data
        
        do {
            let result = try decoder.decode(ExpoUniverselle.self, from: data)
        } catch {
            print("parsing failed")
        }
    }
}

