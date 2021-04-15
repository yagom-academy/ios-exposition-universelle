//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let decoder = Decoder()
        let dataManager = DataPretreatment()
        
    do {
        try dataManager.extractInternalData(from: "items")
        decoder.decodeData([ExpositionItems].self, of: dataManager.data)
    } catch {
        print(error)
        }
    }
}
